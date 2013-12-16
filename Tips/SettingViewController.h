//
//  SettingViewController.h
//  Tips
//
//  Created by Tony Lee on 12/15/13.
//  Copyright (c) 2013 Tony Lee. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SettingViewController : UIViewController

@property (nonatomic, strong) IBOutlet UISegmentedControl *settingControl;
@property (nonatomic, strong) IBOutlet UILabel *defaultPercentLabel;

@end
