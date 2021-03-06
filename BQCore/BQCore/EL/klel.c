//
//  klel.c
//  el
//
//  Created by mac on 2014-02-26.
//  Copyright (c) 2014年 mac. All rights reserved.
//

/*-
 ***********************************************************************
 *
 * $Id: el.c,v 1.57 2012/11/30 19:22:25 klm Exp $
 *
 ***********************************************************************
 *
 * Copyright 2011-2012 The KL-EL Project, All Rights Reserved.
 *
 ***********************************************************************
 */
#include "config.h"

#include <errno.h>
#include <limits.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <sys/types.h>
#ifdef HAVE_SYS_WAIT_H
#include <sys/wait.h>
#endif

#include "klel.h"

static int giArgc = 0;
static char **gppcArgv = NULL;

/*-
 ***********************************************************************
 *
 * GetArgument
 *
 * This is an example function exported into the KL-EL environment. All
 * functions designed to be exported into the environment should return
 * a pointer to a KLEL_VALUE structure, and take an array of pointers to
 * arguments and a void pointer for any cookie that was registered at
 * compile time.
 *
 * Exported functions should return NULL on error and return a value
 * created by KlelCreate{Boolean,Function,Integer,Real,String} on
 * success.
 *
 ***********************************************************************
 */
KLEL_VALUE *
GetArgument(KLEL_VALUE **ppsArgs, void *pvContext)
{
    KLEL_VALUE *psResult = NULL;
    
    if (ppsArgs != NULL && ppsArgs[0] != NULL && ppsArgs[0]->iType == KLEL_TYPE_INT64)
    {
        if (ppsArgs[0]->llInteger >= giArgc)
        {
            fprintf(stderr, "error: %d is an invalid argument\n", (int)(ppsArgs[0]->llInteger));
        }
        else
        {
            psResult = KlelCreateString(strlen(gppcArgv[ppsArgs[0]->llInteger]), gppcArgv[ppsArgs[0]->llInteger]);
        }
    }
    
    return psResult;
}


/*-
 ***********************************************************************
 *
 * Xyzzy
 *
 * This function provides an example of a zero-argument function that is
 * exported into the KL-EL environment.
 *
 ***********************************************************************
 */
KLEL_VALUE *
Xyzzy(KLEL_VALUE **ppsArgs, void *pvContext)
{
    return KlelCreateString(sizeof("Nothing happens.") - 1, "Nothing happens.");
}

/*-
 ***********************************************************************
 *
 * GetTypeOfVar
 *
 * This is a function that returns the type of a named variable. It
 * should return KLEL_TYPE_UNKNOWN on error, and the variable's type on
 * success.
 *
 * While this small function uses if/then/else for matching function
 * names, larger programs might use a perfect hash function to hash
 * variable names and do a switch statement or array lookup.
 *
 * Notice that "argc" is of an atomic type (integer), while "argv" and
 * "xyzzy" are of function type returning strings and taking one and
 * zero arguments respectively.
 *
 ***********************************************************************
 */
KLEL_EXPR_TYPE
GetTypeOfVar(const char *pcName, void *pvContext)
{
    KLEL_EXPR_TYPE iResult = KLEL_TYPE_UNKNOWN;
    
    if (pcName != NULL)
    {
        if (strcmp(pcName, "argc") == 0)
        {
            iResult = KLEL_TYPE_INT64;
        }
        else if (strcmp(pcName, "argv") == 0)
        {
            iResult = KLEL_TYPE_STRING_FUNCTION1(KLEL_TYPE_INT64);
        }
        else if (strcmp(pcName, "xyzzy") == 0)
        {
            iResult = KLEL_TYPE_STRING_FUNCTION0();
        }
    }
    
    return iResult;
}


/*-
 ***********************************************************************
 *
 * GetValueOfVar
 *
 * This function returns a value for a named variable, much like
 * GetTypeOfVar returns a variable's type. NULL can be returned on
 * error and any value created by
 * KlelCreate{Boolean,Function,Integer,Real,String} on success.
 *
 * Note that the same type must be used when creating a function as was
 * returned by GetTypeOfVar.
 *
 ***********************************************************************
 */
KLEL_VALUE *
GetValueOfVar(const char *pcName, void *pvContext)
{
    KLEL_VALUE *psResult = NULL;
    
    if (pcName != NULL)
    {
        if (strcmp(pcName, "argc") == 0)
        {
            psResult = KlelCreateInteger(giArgc);
        }
        else if (strcmp(pcName, "argv") == 0)
        {
            psResult = KlelCreateFunction(KLEL_TYPE_STRING_FUNCTION1(KLEL_TYPE_INT64), "argc", GetArgument);
        }
        else if (strcmp(pcName, "xyzzy") == 0)
        {
            psResult = KlelCreateFunction(KLEL_TYPE_STRING_FUNCTION0(), "xyzzy", Xyzzy);
        }
    }
    
    return psResult;
}


/*-
 ***********************************************************************
 *
 * el
 *
 ***********************************************************************
 */
int el(PTArgumentEl ptArgumentEl)
{
    size_t        szi          = 0;
    const char   *pcCommandStatus = "fail";
    const char   *pcExprType   = NULL;
    char         *pcExpression = NULL;
    char         *pcExprName   = NULL;
    KLEL_COMMAND *psCommand    = NULL;
    KLEL_CONTEXT *psContext    = NULL;
    KLEL_VALUE   *psResult     = NULL;
    size_t        szLength     = 0;
    char         *pcString     = NULL;
    char         *pcValue      = NULL;
    int           iCommandExitCode = 0;
    int           iResult      = 0;
    
    
    
    
    /*-
     *********************************************************************
     *
     * Initialize global variables used by the callback functions.
     *
     *********************************************************************
     */
    giArgc = ptArgumentEl->iArgumentCount;
    gppcArgv = ptArgumentEl->ppcArguments;
    
    /*-
     *********************************************************************
     *
     * Compile the expression, returning a context. The 0 indicates that
     * default compilation flags should be used. We pass in our callback
     * functions so that the variables we export are available inside
     * expressions. The final NULL is a cookie that will be passed to our
     * callbacks; we don't need one, so we set it to NULL here. Passing
     * NULLs for the two callbacks means that all we'd have is the
     * standard library (note that if you do pass callbacks, you still get
     * the standard library, but in the instance of name collisions, your
     * callbacks win).
     *
     *********************************************************************
     */
    psContext = KlelCompile(pcExpression, 0, GetTypeOfVar, GetValueOfVar, NULL);
    
    /*-
     *********************************************************************
     *
     * If the expression compiled correctly, KlelIsValid() will return
     * true. Otherwise, it returns false, and we need to walk the error
     * list provided in the context to see what happened.
     *
     *********************************************************************
     */
    if (!KlelIsValid(psContext))
    {
        fprintf(stderr, "error: %s\n", KlelGetError(psContext));
        KlelFreeContext(psContext);
        return XER_Setup;
    }
    
    /*-
     *********************************************************************
     *
     * Conditionally print the type of expression being evaluated.
     *
     *********************************************************************
     */
    if (ptArgumentEl->iDebugMode)
    {
        printf("KlelType='%s'\n", (KlelIsGuardedCommand(psContext)) ? "guarded command" : "value expression");
        
        
        /*-
         *********************************************************************
         *
         * Conditionally print the compiled expression.
         *
         *********************************************************************
         */
        
        pcString = KlelExpressionToString(psContext, KLEL_EXPRESSION_ONLY);
        if (pcString == NULL)
        {
            fprintf(stderr, "error: out of memory\n");
            return XER_Out_Of_Memory;
        }
        printf("KlelExpr='%s'\n", pcString);
        free(pcString);
        
        
        /*-
         *********************************************************************
         *
         * Conditionally print the expression's name, which is automatically
         * generated unless the user provided one.
         *
         *********************************************************************
         */
        
        pcExprName = KlelGetName(psContext);
        if (pcExprName == NULL)
        {
            fprintf(stderr, "error: out of memory\n");
            return XER_Out_Of_Memory;
        }
        printf("KlelExprName='%s'\n", pcExprName);
    }
    
    /*-
     *********************************************************************
     *
     * Execute the expression. In general, expressions can be executed
     * as many times as desired. Naturally, any values for variables (as
     * returned by their designated callback functions) used in the
     * expression may change over time (i.e., there is no requirement
     * that they remsssain static).
     *
     *********************************************************************
     */
    psResult = KlelExecute(psContext);
    
    /*-
     *********************************************************************
     *
     * Conditionally print the expression's status.
     *
     *********************************************************************
     */
    if (ptArgumentEl->iDebugMode)
    {
        printf("KlelExprStatus='%s'\n", (psResult == NULL) ? "fail" : "pass");
    }
    
    /*-
     *********************************************************************
     *
     * If the expression executed correctly, a pointer to a result
     * structure is returned. Otherwise, NULL is returned, and we need
     * to walk the error list provided in the context to see what
     * happened.
     *
     *********************************************************************
     */
    if (psResult == NULL)
    {
        fprintf(stderr, "error: %s\n", KlelGetError(psContext));
        KlelFreeContext(psContext);
        return XER_Execute;
    }
    
    /*-
     *********************************************************************
     *
     * Conditionally print the expression's type.
     *
     *********************************************************************
     */
    if (ptArgumentEl->iDebugMode)
    {
        switch (psResult->iType)
        {
            case KLEL_EXPR_BOOLEAN:
                pcExprType = "boolean";
                break;
            case KLEL_EXPR_REAL:
                pcExprType = "real";
                break;
            case KLEL_EXPR_INTEGER:
                pcExprType = "integer";
                break;
            case KLEL_EXPR_STRING:
                pcExprType = "string";
                break;
            default:
                KLEL_ASSERT(0);
                pcExprType = "unknown";
                break;
        }
        printf("KlelExprType='%s'\n", pcExprType);
    }
    
    /*-
     *********************************************************************
     *
     * KL-EL supports two types of expressions: value expressions and
     * guarded commands. A value expression is just a normal expression
     * that evaluates to a single value of some type, and a guarded
     * command is a special kind of expression that can be used to
     * specify a "command" to execute with a "guard expression". The
     * guard expression (which must be boolean) is evaluated when the
     * expression is executed, and if the expression evaluates to true,
     * the programmer can decide what to do with the command. This is in
     * contrast to a normal ternary conditional (p ? t : f), in which it
     * might not be possible to determine if the value returned is the
     * "false" value, or the literal value entered by the user.
     *
     * If the user entered a guarded command, we evaluate the guard and
     * conditionally execute the command and print out its results. If
     * user entered a value expression, we simply evalute it and print
     * out the result.
     *
     * Note that guarded commands are typically executed using the
     * "system" interpreter. Another common interpreter, "exec", could
     * also be used, but that requires POSIX and this program is
     * designed to work on non-POSIX platforms. There is also a simple
     * "echo" interpreter, which just echos its arugments.
     *
     *********************************************************************
     */
    if (KlelIsGuardedCommand(psContext))
    {
        if (psResult->bBoolean)
        {
            psCommand = KlelGetCommand(psContext);
            if (psCommand == NULL)
            {
                fprintf(stderr, "error: %s\n", KlelGetError(psContext));
                KlelFreeResult(psResult);
                KlelFreeContext(psContext);
                return XER_GuardedCommand;
            }
            else
            {
                if (ptArgumentEl->iDebugMode)
                {
                    printf("KlelInterpreter='%s'\n", psCommand->acInterpreter);
                }
                if (strcmp(psCommand->acInterpreter, "system") == 0)
                {
                    if (ptArgumentEl->iDebugMode)
                    {
                        printf("KlelCommand='%s'\n", psCommand->acProgram);
                        printf("KlelCommandOutput=<<EndOfOutput\n");
                    }
                    iResult = system(psCommand->acProgram);
                    if (iResult == -1)
                    {
                        iCommandExitCode = iResult;
                        fprintf(stderr, "error: system interpreter failed (%s)\n", strerror(errno));
                    }
                    else
                    {
#ifdef WIN32
                        iCommandExitCode = iResult;
#else
                        iCommandExitCode = WEXITSTATUS(iResult);
#endif
                    }
                    if (ptArgumentEl->iDebugMode)
                    {
                        printf("EndOfOutput\n");
                    }
                }
                else if (strcmp(psCommand->acInterpreter, "echo") == 0)
                {
                    if (ptArgumentEl->iDebugMode)
                    {
                        printf("KlelCommand='echo'\n");
                        printf("KlelCommandOutput=<<EndOfOutput\n");
                    }
                    for (szi = 0; szi < KLEL_MAX_FUNC_ARGS; szi++)
                    {
                        if (psCommand->ppcArgumentVector[szi] != NULL)
                        {
                            printf("%s%s", (szi == 0) ? "" : " ", psCommand->ppcArgumentVector[szi]);
                        }
                    }
                    printf("\n");
                    if (ptArgumentEl->iDebugMode)
                    {
                        printf("EndOfOutput\n");
                    }
                    iCommandExitCode = 0;
                }
                else
                {
                    fprintf(stderr, "error: unknown interpreter '%s'\n", psCommand->acInterpreter);
                }
                KlelFreeCommand(psCommand);
                if (KlelIsSuccessReturnCode(psContext, iCommandExitCode))
                {
                    pcCommandStatus = "pass";
                }
            }
        }
        if (ptArgumentEl->iDebugMode)
        {
            printf("KlelCommandExitCode='%u'\n", iCommandExitCode);
            printf("KlelCommandStatus='%s'\n", pcCommandStatus);
        }
    }
    else
    {
        pcValue = KlelValueToString(psResult, &szLength);
        if (pcValue == NULL)
        {
            fprintf(stderr, "error: out of memory\n");
            return XER_Out_Of_Memory;
        }
        if (ptArgumentEl->iDebugMode)
        {
            printf("KlelExprOutput=<<EndOfOutput\n");
        }
        printf("%s\n", pcValue);
        if (ptArgumentEl->iDebugMode)
        {
            printf("EndOfOutput\n");
        }
        free(pcValue);
    }
    
    /*-
     *********************************************************************
     *
     * Shutdown and go home.
     *
     *********************************************************************
     */
    KlelFreeResult(psResult);
    KlelFreeContext(psContext);
    
    return XER_OK;
}

/*---------------------------------------------------------------------
 *
 *
 *
 ----------------------------------------------------------------------
 */

char *gcExpression = NULL;

KLEL_VALUE *
GetArgument2(KLEL_VALUE **ppsArgs, void *pvContext)
{
    KLEL_VALUE *psResult = NULL;
    
    if (ppsArgs != NULL && ppsArgs[0] != NULL && ppsArgs[0]->iType == KLEL_TYPE_INT64)
    {
        if (ppsArgs[0]->llInteger >= 1)
        {
            fprintf(stderr, "error: %d is an invalid argument\n", (int)(ppsArgs[0]->llInteger));
        }
        else
        {
            psResult = KlelCreateString(strlen(gcExpression), gcExpression);
        }
    }
    
    return psResult;
}


KLEL_EXPR_TYPE
GetTypeOfVar2(const char *pcName, void *pvContext)
{
    KLEL_EXPR_TYPE iResult = KLEL_TYPE_UNKNOWN;
    
    if (pcName != NULL)
    {
        if (strcmp(pcName, "argc") == 0)
        {
            iResult = KLEL_TYPE_INT64;
        }
        else if (strcmp(pcName, "argv") == 0)
        {
            iResult = KLEL_TYPE_STRING_FUNCTION1(KLEL_TYPE_INT64);
        }
        //        else if (strcmp(pcName, "xyzzy") == 0)
        //        {
        //            iResult = KLEL_TYPE_STRING_FUNCTION0();
        //        }
    }
    
    return iResult;
}


KLEL_VALUE *
GetValueOfVar2(const char *pcName, void *pvContext)
{
    KLEL_VALUE *psResult = NULL;
    
    if (pcName != NULL)
    {
        if (strcmp(pcName, "argc") == 0)
        {
            psResult = KlelCreateInteger(1);
        }
        else if (strcmp(pcName, "argv") == 0)
        {
            psResult = KlelCreateFunction(KLEL_TYPE_STRING_FUNCTION1(KLEL_TYPE_INT64), "argc", GetArgument);
        }
        //        else if (strcmp(pcName, "xyzzy") == 0)
        //        {
        //            psResult = KlelCreateFunction(KLEL_TYPE_STRING_FUNCTION0(), "xyzzy", Xyzzy);
        //        }
    }
    
    return psResult;
}


int executeExpression (char *pcExpression,char*pcResult)
{
    size_t        szi          = 0;
    const char   *pcCommandStatus = "fail";
    KLEL_COMMAND *psCommand    = NULL;
    KLEL_CONTEXT *psContext    = NULL;
    KLEL_VALUE   *psResult     = NULL;
    size_t        szLength     = 0;
    char         *pcValue      = NULL;
    int           iCommandExitCode = 0;
    int           iResult      = 0;
    
    /*-
     *********************************************************************
     *
     * Initialize global variables used by the callback functions.
     *
     *********************************************************************
     */
    //    giArgc = ptArgumentEl->iArgumentCount;
    //    gppcArgv = ptArgumentEl->ppcArguments;
    gcExpression = pcExpression;
    /*-
     *********************************************************************
     *
     * Compile the expression, returning a context. The 0 indicates that
     * default compilation flags should be used. We pass in our callback
     * functions so that the variables we export are available inside
     * expressions. The final NULL is a cookie that will be passed to our
     * callbacks; we don't need one, so we set it to NULL here. Passing
     * NULLs for the two callbacks means that all we'd have is the
     * standard library (note that if you do pass callbacks, you still get
     * the standard library, but in the instance of name collisions, your
     * callbacks win).
     *
     *********************************************************************
     */
    psContext = KlelCompile(pcExpression, 0, GetTypeOfVar2, GetValueOfVar2, NULL);
    
    /*-
     *********************************************************************
     *
     * If the expression compiled correctly, KlelIsValid() will return
     * true. Otherwise, it returns false, and we need to walk the error
     * list provided in the context to see what happened.
     *
     *********************************************************************
     */
    if (!KlelIsValid(psContext))
    {
        fprintf(stderr, "error: %s\n", KlelGetError(psContext));
        KlelFreeContext(psContext);
        return XER_Setup;
    }
    
    /*-
     *********************************************************************
     *
     * Execute the expression. In general, expressions can be executed
     * as many times as desired. Naturally, any values for variables (as
     * returned by their designated callback functions) used in the
     * expression may change over time (i.e., there is no requirement
     * that they remsssain static).
     *
     *********************************************************************
     */
    psResult = KlelExecute(psContext);
    
    /*-
     *********************************************************************
     *
     * If the expression executed correctly, a pointer to a result
     * structure is returned. Otherwise, NULL is returned, and we need
     * to walk the error list provided in the context to see what
     * happened.
     *
     *********************************************************************
     */
    if (psResult == NULL)
    {
        fprintf(stderr, "error: %s\n", KlelGetError(psContext));
        KlelFreeContext(psContext);
        return XER_Execute;
    }
    
    /*-
     *********************************************************************
     *
     * KL-EL supports two types of expressions: value expressions and
     * guarded commands. A value expression is just a normal expression
     * that evaluates to a single value of some type, and a guarded
     * command is a special kind of expression that can be used to
     * specify a "command" to execute with a "guard expression". The
     * guard expression (which must be boolean) is evaluated when the
     * expression is executed, and if the expression evaluates to true,
     * the programmer can decide what to do with the command. This is in
     * contrast to a normal ternary conditional (p ? t : f), in which it
     * might not be possible to determine if the value returned is the
     * "false" value, or the literal value entered by the user.
     *
     * If the user entered a guarded command, we evaluate the guard and
     * conditionally execute the command and print out its results. If
     * user entered a value expression, we simply evalute it and print
     * out the result.
     *
     * Note that guarded commands are typically executed using the
     * "system" interpreter. Another common interpreter, "exec", could
     * also be used, but that requires POSIX and this program is
     * designed to work on non-POSIX platforms. There is also a simple
     * "echo" interpreter, which just echos its arugments.
     *
     *********************************************************************
     */
    if (KlelIsGuardedCommand(psContext))
    {
        if (psResult->bBoolean)
        {
            psCommand = KlelGetCommand(psContext);
            if (psCommand == NULL)
            {
                fprintf(stderr, "error: %s\n", KlelGetError(psContext));
                KlelFreeResult(psResult);
                KlelFreeContext(psContext);
                return XER_GuardedCommand;
            }
            else
            {
                
                if (strcmp(psCommand->acInterpreter, "system") == 0)
                {
                    
                    iResult = system(psCommand->acProgram);
                    if (iResult == -1)
                    {
                        iCommandExitCode = iResult;
                        fprintf(stderr, "error: system interpreter failed (%s)\n", strerror(errno));
                    }
                    else
                    {
#ifdef WIN32
                        iCommandExitCode = iResult;
#else
                        iCommandExitCode = WEXITSTATUS(iResult);
#endif
                    }
                    
                }
                else if (strcmp(psCommand->acInterpreter, "echo") == 0)
                {
                    
                    for (szi = 0; szi < KLEL_MAX_FUNC_ARGS; szi++)
                    {
                        if (psCommand->ppcArgumentVector[szi] != NULL)
                        {
                            printf("%s%s", (szi == 0) ? "" : " ", psCommand->ppcArgumentVector[szi]);
                        }
                    }
                    printf("\n");
                    
                    iCommandExitCode = 0;
                }
                else
                {
                    fprintf(stderr, "error: unknown interpreter '%s'\n", psCommand->acInterpreter);
                }
                KlelFreeCommand(psCommand);
                if (KlelIsSuccessReturnCode(psContext, iCommandExitCode))
                {
                    pcCommandStatus = "pass";
                }
            }
        }
        
    }
    else
    {
        pcValue = KlelValueToString(psResult, &szLength);
        if (pcValue == NULL)
        {
            fprintf(stderr, "error: out of memory\n");
            return XER_Out_Of_Memory;
        }
        
        if (pcResult != NULL) {
            strcpy(pcResult, pcValue);
        }
        printf("%s\n", pcValue);
        
        free(pcValue);
    }
    
    /*-
     *********************************************************************
     *
     * Shutdown and go home.
     *
     *********************************************************************
     */
    KlelFreeResult(psResult);
    KlelFreeContext(psContext);
    
    return XER_OK;
}

