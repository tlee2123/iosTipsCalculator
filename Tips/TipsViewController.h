//
//  TipsViewController.h
//  Tips
//
//  Created by Tony Lee on 12/12/13.
//  Copyright (c) 2013 Tony Lee. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TipsViewController : UIViewController <UITextFieldDelegate>

@property (nonatomic, strong) IBOutlet UITextField *amountTextField;
@property (nonatomic, strong) IBOutlet UILabel *tipLabel;
@property (nonatomic, strong) IBOutlet UILabel *totalLabel;
@property (nonatomic, strong) IBOutlet UISegmentedControl *tipControl;

@end
