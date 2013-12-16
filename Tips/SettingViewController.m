//
//  SettingViewController.m
//  Tips
//
//  Created by Tony Lee on 12/15/13.
//  Copyright (c) 2013 Tony Lee. All rights reserved.
//

#import "SettingViewController.h"

@interface SettingViewController ()

@property (nonatomic, strong) NSUserDefaults *defaults;

-(void)onControlValueChanged:(UISegmentedControl *)sender;

@end


@implementation SettingViewController

@synthesize settingControl;
@synthesize defaultPercentLabel;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        self.settingControl = [[UISegmentedControl alloc] init];
        self.defaults = [NSUserDefaults standardUserDefaults];
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    [settingControl addTarget:self action:@selector(onControlValueChanged:) forControlEvents:UIControlEventValueChanged];
}

- (void)viewWillAppear:(BOOL)animated {
    NSLog(@"view will appear");
    NSInteger defaultPercent = [self.defaults integerForKey:@"defaultPercent"];
    self.settingControl.selectedSegmentIndex = defaultPercent;
    self.defaultPercentLabel.text = [self.settingControl titleForSegmentAtIndex:self.settingControl.selectedSegmentIndex];
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Private methods
-(void)onControlValueChanged:(UISegmentedControl *)sender {
    NSLog(@"value changed");
    [self.defaults setInteger:sender.selectedSegmentIndex forKey:@"defaultPercent"];
    self.defaultPercentLabel.text = [self.settingControl titleForSegmentAtIndex:self.settingControl.selectedSegmentIndex];
}

@end
