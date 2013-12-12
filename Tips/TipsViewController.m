//
//  TipsViewController.m
//  Tips
//
//  Created by Tony Lee on 12/12/13.
//  Copyright (c) 2013 Tony Lee. All rights reserved.
//

#import "TipsViewController.h"

@interface TipsViewController ()

@property (nonatomic, strong) NSArray *percentArray;

-(void)doneEditTextField;
-(void)calculateTipForControl:(UISegmentedControl *) sender;
-(void)calculateTip:(float)tip;

@end

@implementation TipsViewController

@synthesize amountTextField;
@synthesize tipLabel;
@synthesize totalLabel;
@synthesize tipControl;
@synthesize percentArray;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        self.percentArray = [NSArray arrayWithObjects:@0.10, @0.15, @0.20, nil];
        
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self.tipControl addTarget:self action:@selector(calculateTipForControl:) forControlEvents:UIControlEventValueChanged];
    self.tipControl.selectedSegmentIndex = 1;
    self.amountTextField.delegate = self;
    self.amountTextField.text = @"";
    self.tipLabel.text = @"";
    self.totalLabel.text = @"";

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Private methods
-(void)calculateTipForControl:(UISegmentedControl *) sender {
    float tip = [self.percentArray[sender.selectedSegmentIndex] floatValue];
    [self calculateTip:tip];
}

-(void)doneEditTextField {
    float tip = [self.percentArray[self.tipControl.selectedSegmentIndex] floatValue];
    [self calculateTip:tip];
    self.navigationItem.rightBarButtonItem = nil;
    [self.view endEditing:YES];
}

-(void)calculateTip:(float) tip {
    float amount = [[self.amountTextField.text stringByReplacingOccurrencesOfString:@"$" withString:@""] floatValue];
    float tipAmount = tip * amount;
    self.tipLabel.text = [NSString stringWithFormat:@"$%.2f", tipAmount];
    float totalAmount = amount + tipAmount;
    self.totalLabel.text = [NSString stringWithFormat:@"$%.2f", totalAmount];
}


#pragma mark - UITextField delegates
-(BOOL)textFieldShouldBeginEditing:(UITextField *)textField {
    UIBarButtonItem *doneBarButtonItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemDone target:self action:@selector(doneEditTextField)];

    self.navigationItem.rightBarButtonItem = doneBarButtonItem;
    return YES;
}

-(BOOL)textFieldShouldEndEditing:(UITextField *)textField {
    self.amountTextField.text = [NSString stringWithFormat:@"$%@", self.amountTextField.text];
    return YES;
}



@end
