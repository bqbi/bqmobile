//
//  BQContentViewController.h
//  BQMobile
//
//  Created by mac on 2014-02-26.
//  Copyright (c) 2014年 yonyou. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MSSlidingPanelController.h"

/**
 *  These options are used to set the gestures to open a panel.
 */
typedef NS_ENUM(NSUInteger, BQEventSelectedMode)
{
    /**
     *  侧边栏-最近打开-功能选择.
     */
    BQEventSelectedModeRecent         =   0,
    
    /**
     *  侧边栏-最近打开-功能选择.
     */
    BQEventSelectedModeInBox          =   1,
    
    /**
     *  The user can slide the nav bar of the central view.
     */
    BQEventSelectedModeCollection     =   2,
    
};

@protocol BQLeftSidePanelFunctionDelegate <NSObject>

@optional
- (void) openPanelViewController:(BQEventSelectedMode) eventSelectedMode;

@end

@interface BQContentViewController : UIViewController<MSSlidingPanelControllerDelegate, BQLeftSidePanelFunctionDelegate>

@end
