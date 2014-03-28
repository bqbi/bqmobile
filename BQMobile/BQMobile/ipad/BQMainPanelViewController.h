//
//  CenterPanelViewController.h
//  LeftDragPanelDemo
//
//  Created by mac on 2014-02-26.
//  Copyright (c) 2014年 QZ. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MSSlidingPanelController.h"

@interface BQMainPanelViewController : UIViewController <MSSlidingPanelControllerDelegate>

@property (nonatomic,assign) BOOL hasStateBar;

@end
