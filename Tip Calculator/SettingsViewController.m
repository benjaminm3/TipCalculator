//
//  SettingsViewController.m
//  Tip Calculator
//
//  Created by Benjamin Chang on 2/22/14.
//  Copyright (c) 2014 Benjamin Chang. All rights reserved.
//

#import "SettingsViewController.h"

@interface SettingsViewController ()
@property (weak, nonatomic) IBOutlet UITextField *firstTextField;
@property (weak, nonatomic) IBOutlet UITextField *secondTextField;
@property (weak, nonatomic) IBOutlet UITextField *thirdTextField;
- (IBAction)onTap:(id)sender;
- (void)readValues;

@end

@implementation SettingsViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self readValues];
    [self updateValues];

    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)updateValues {
    int firstPercentage = [self.firstTextField.text intValue];
    int secondPercentage = [self.secondTextField.text intValue];
    int thirdPercentage = [self.thirdTextField.text intValue];
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    [defaults setInteger:firstPercentage forKey:@"firstValue"];
    [defaults setInteger:secondPercentage forKey:@"secondValue"];
    [defaults setInteger:thirdPercentage forKey:@"thirdValue"];
    [defaults synchronize];
}

- (IBAction)onTap:(id)sender {
    [self.view endEditing:YES];
    [self updateValues];
}
- (void)readValues {
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    NSString *firstString = [NSString stringWithFormat:@"%i", [defaults integerForKey:@"firstValue"]];
    NSString *secondString = [NSString stringWithFormat:@"%i", [defaults integerForKey:@"secondValue"]];
    NSString *thirdString = [NSString stringWithFormat:@"%i", [defaults integerForKey:@"thirdValue"]];
    self.firstTextField.text = firstString;
    self.secondTextField.text = secondString;
    self.thirdTextField.text = thirdString;
}
@end
