//
//  TipViewController.m
//  Tip Calculator
//
//  Created by Benjamin Chang on 2/22/14.
//  Copyright (c) 2014 Benjamin Chang. All rights reserved.
//

#import "TipViewController.h"
#import "SettingsViewController.h"

@interface TipViewController ()
@property (weak, nonatomic) IBOutlet UILabel *tipLabel;
@property (weak, nonatomic) IBOutlet UILabel *totalLabel;
@property (weak, nonatomic) IBOutlet UITextField *billTextField;
@property (weak, nonatomic) IBOutlet UISegmentedControl *tipControl;

- (IBAction)onTap:(id)sender;
- (void)updateValues;
- (void)updateTipPercentages;
@end

@implementation TipViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        self.title = @"Tip Calculator";
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self updateValues];
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"Settings" style:UIBarButtonItemStylePlain target:self action:@selector(onSettingsButton)];
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)onTap:(id)sender {
    [self.view endEditing:YES];
    [self updateValues];
}
- (void)updateValues {
    float billAmount = [self.billTextField.text floatValue];
    float firstPercentage = [[self.tipControl titleForSegmentAtIndex:0] floatValue]/100;
    float secondPercentage = [[self.tipControl titleForSegmentAtIndex:1] floatValue]/100;
    float thirdPercentage = [[self.tipControl titleForSegmentAtIndex:2] floatValue]/100;
    
    NSArray *tipValues = @[[NSNumber numberWithFloat:firstPercentage],[NSNumber numberWithFloat:secondPercentage],[NSNumber numberWithFloat:thirdPercentage]];
    
    float tipAmount = billAmount * [tipValues[self.tipControl.selectedSegmentIndex] floatValue];
    float totalAmount = tipAmount + billAmount;
    self.tipLabel.text = [NSString stringWithFormat:@"$%0.2f", tipAmount];
    self.totalLabel.text = [NSString stringWithFormat:@"$%0.2f", totalAmount];
}
- (void)onSettingsButton {
    [self.navigationController pushViewController:[[SettingsViewController alloc] init] animated:YES];
}

- (void)viewWillAppear:(BOOL)animated {
    NSLog(@"view will appear");
    [self updateTipPercentages];
}

- (void)viewDidAppear:(BOOL)animated {
    NSLog(@"view did appear");
}

- (void)viewWillDisappear:(BOOL)animated {
    NSLog(@"view will disappear");
}

- (void)viewDidDisappear:(BOOL)animated {
    NSLog(@"view did disappear");
}

- (void)updateTipPercentages {
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    NSString *firstString = [NSString stringWithFormat:@"%i%%", [defaults integerForKey:@"firstValue"]];
    NSString *secondString = [NSString stringWithFormat:@"%i%%", [defaults integerForKey:@"secondValue"]];
    NSString *thirdString = [NSString stringWithFormat:@"%i%%", [defaults integerForKey:@"thirdValue"]];
    [self.tipControl setTitle:firstString forSegmentAtIndex:0];
    [self.tipControl setTitle:secondString forSegmentAtIndex:1];
    [self.tipControl setTitle:thirdString forSegmentAtIndex:2];
    
}
@end
