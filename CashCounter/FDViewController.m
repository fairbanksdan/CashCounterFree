//
//  FDViewController.m
//  CashCounter
//
//  Created by Daniel Fairbanks on 4/28/14.
//  Copyright (c) 2014 Fairbanksdan. All rights reserved.
//

#import "FDViewController.h"

@interface FDViewController () <UITextFieldDelegate,UIGestureRecognizerDelegate>

@property (strong, nonatomic) NSString *str;

@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;

@property (strong,nonatomic) NSArray *textFields;

@end

@implementation FDViewController
{
    float _pennyCount;
    float _nickelCount;
    float _dimeCount;
    float _quarterCount;
    
    float _singleDollarCount;
    float _fiveDollarCount;
    float _tenDollarCount;
    float _twentyDollarCount;
    float _fiftyDollarCount;
    float _hundredDollarCount;
    
    float _grandTotalCount;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.textFields = @[_pennyTextField,_nickelTextField,_dimeTextField,_quarterTextField,_singleDollarTextField,_fiveDollarTextField,_tenDollarTextField,_twentyDollarTextField,_fiftyDollarTextField,_hundredDollarTextField];
    
    UITapGestureRecognizer *tapOutside = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(dismissKeyboard:)];
    [self.scrollView addGestureRecognizer:tapOutside];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark textField Methods

- (IBAction)pennyCounter:(id)sender {
    _str = [_pennyTextField text];
    
    _pennyCount = [_str intValue]*0.01;
    
    [self Updatelabels];
}

- (IBAction)nickelCounter:(id)sender {
    _str = [_nickelTextField text];
    
    _nickelCount = [_str intValue]*0.05;
    
    [self Updatelabels];
}

- (IBAction)dimeCounter:(id)sender {
    _str = [_dimeTextField text];
    
    _dimeCount = [_str intValue]*0.1;
    
    [self Updatelabels];
}

- (IBAction)quarterCounter:(id)sender {
    _str = [_quarterTextField text];
    
    _quarterCount = [_str intValue]*0.25;
    
    [self Updatelabels];
}

- (IBAction)singleDollarCounter:(id)sender {
    _str = [_singleDollarTextField text];
    
    _singleDollarCount = [_str intValue];
    
    [self Updatelabels];
}

- (IBAction)fiveDollarCounter:(id)sender {
    _str = [_fiveDollarTextField text];
    
    _fiveDollarCount = [_str intValue]*5;
    
    [self Updatelabels];
}

- (IBAction)tenDollarCounter:(id)sender {
    _str = [_tenDollarTextField text];
    
    _tenDollarCount = [_str intValue]*10;
    
    [self Updatelabels];
}

- (IBAction)twentyDollarCounter:(id)sender {
    _str = [_twentyDollarTextField text];
    
    _twentyDollarCount = [_str intValue]*20;
    
    [self Updatelabels];
}

- (IBAction)fiftyDollarCounter:(id)sender {
    _str = [_fiftyDollarTextField text];
    
    _fiftyDollarCount = [_str intValue]*50;
    
    [self Updatelabels];
}

- (IBAction)hundredDollarCounter:(id)sender {
    _str = [_hundredDollarTextField text];
    
    _hundredDollarCount = [_str intValue]*100;
    
    [self Updatelabels];
}

#pragma mark Update Labels Method

-(void)Updatelabels
{
    _grandTotalCount = _pennyCount+_nickelCount+_dimeCount+_quarterCount+_singleDollarCount+_fiftyDollarCount+_tenDollarCount+_twentyDollarCount+_fiftyDollarCount+_hundredDollarCount;
    
    NSNumberFormatter *currencyFormatter = [[NSNumberFormatter alloc] init];
    [currencyFormatter setNumberStyle:NSNumberFormatterCurrencyStyle];
    [currencyFormatter setCurrencySymbol:@""];
    
    self.pennyTotalLabel.text = [NSString stringWithFormat:@"%@",[currencyFormatter stringFromNumber:[NSNumber numberWithFloat:_pennyCount]]];
    self.nickelTotalLabel.text = [NSString stringWithFormat:@"%@",[currencyFormatter stringFromNumber:[NSNumber numberWithFloat:_nickelCount]]];
    self.dimeTotalLabel.text = [NSString stringWithFormat:@"%@",[currencyFormatter stringFromNumber:[NSNumber numberWithFloat:_dimeCount]]];
    self.quarterTotalLabel.text = [NSString stringWithFormat:@"%@",[currencyFormatter stringFromNumber:[NSNumber numberWithFloat:_quarterCount]]];
    self.singleDollarTotalLabel.text = [NSString stringWithFormat:@"%@",[currencyFormatter stringFromNumber:[NSNumber numberWithFloat:_singleDollarCount]]];
    self.fiveDollarTotalLabel.text = [NSString stringWithFormat:@"%@",[currencyFormatter stringFromNumber:[NSNumber numberWithFloat:_fiveDollarCount]]];
    self.tenDollarTotalLabel.text = [NSString stringWithFormat:@"%@",[currencyFormatter stringFromNumber:[NSNumber numberWithFloat:_tenDollarCount]]];
    self.twentyDollarTotalLabel.text = [NSString stringWithFormat:@"%@",[currencyFormatter stringFromNumber:[NSNumber numberWithFloat:_twentyDollarCount]]];
    self.fiftyDollarTotalLabel.text = [NSString stringWithFormat:@"%@",[currencyFormatter stringFromNumber:[NSNumber numberWithFloat:_fiftyDollarCount]]];
    self.hundredDollarTotalLabel.text = [NSString stringWithFormat:@"%@",[currencyFormatter stringFromNumber:[NSNumber numberWithFloat:_hundredDollarCount]]];
    
    self.GrandTotalLabel.text = [NSString stringWithFormat:@"$%@",[currencyFormatter stringFromNumber:[NSNumber numberWithFloat:_grandTotalCount]]];
    
}

- (void)setCurrencySymbol:(NSString *)string
{
    string = [NSString stringWithFormat:@""];
}

#pragma mark Reset Button Method

- (IBAction)resetButton:(id)sender {
    
    NSString *emptyString = [NSString stringWithFormat:@""];
    
    _pennyCount = 0;
    _nickelCount = 0;
    _dimeCount = 0;
    _quarterCount = 0;
    _singleDollarCount = 0;
    _fiveDollarCount = 0;
    _tenDollarCount = 0;
    _twentyDollarCount = 0;
    _fiftyDollarCount = 0;
    _hundredDollarCount = 0;
    _grandTotalCount = 0;
    
    self.pennyTotalLabel.text = [NSString stringWithFormat:@"%.02f",_pennyCount];
    self.nickelTotalLabel.text = [NSString stringWithFormat:@"%.02f",_nickelCount];
    self.dimeTotalLabel.text = [NSString stringWithFormat:@"%.02f",_dimeCount];
    self.quarterTotalLabel.text = [NSString stringWithFormat:@"%.02f",_quarterCount];
    self.singleDollarTotalLabel.text = [NSString stringWithFormat:@"%.02f",_singleDollarCount];
    self.fiveDollarTotalLabel.text = [NSString stringWithFormat:@"%.02f",_fiveDollarCount];
    self.tenDollarTotalLabel.text = [NSString stringWithFormat:@"%.02f",_tenDollarCount];
    self.twentyDollarTotalLabel.text = [NSString stringWithFormat:@"%.02f",_twentyDollarCount];
    self.fiftyDollarTotalLabel.text = [NSString stringWithFormat:@"%.02f",_fiftyDollarCount];
    self.hundredDollarTotalLabel.text = [NSString stringWithFormat:@"%.02f",_hundredDollarCount];
    self.GrandTotalLabel.text = [NSString stringWithFormat:@"$%.02f",_grandTotalCount];
    
    self.pennyTextField.text = emptyString;
    self.nickelTextField.text = emptyString;
    self.dimeTextField.text = emptyString;
    self.quarterTextField.text = emptyString;
    self.singleDollarTextField.text = emptyString;
    self.fiveDollarTextField.text = emptyString;
    self.tenDollarTextField.text = emptyString;
    self.twentyDollarTextField.text = emptyString;
    self.fiftyDollarTextField.text = emptyString;
    self.hundredDollarTextField.text = emptyString;
}

#pragma mark Keyboard Methods

-(BOOL)textFieldShouldReturn:(UITextField*)textField;
{
    NSInteger nextTag = textField.tag + 1;
    
    UIResponder* nextResponder = [textField.superview viewWithTag:nextTag];
    if (nextResponder) {
        
        [nextResponder becomeFirstResponder];
    } else {
        // Not found, so remove keyboard.
        [textField resignFirstResponder];
    }
    return NO; // We do not want UITextField to insert line-breaks.
}

- (void)textFieldDidBeginEditing:(UITextField *)textField
{
    if (textField.frame.origin.y > 300 && textField.frame.origin.y < 400)
    {
        [self.scrollView setContentOffset:CGPointMake(0, textField.frame.origin.y - 278) animated:YES];
    } else if (textField.frame.origin.y > 400)
    {
        [self.scrollView setContentOffset:CGPointMake(0, textField.frame.origin.y - 270) animated:YES];
    }
}

- (void)textFieldDidEndEditing:(UITextField *)textField
{
    [self.scrollView setContentOffset:CGPointMake(0, 0) animated:YES];
}

-(void)dismissKeyboard:(id)sender
{
    for (UITextField *textField in self.textFields)
    {
        [textField resignFirstResponder];
    }
}

#pragma mark iAd Delegate Methods

-(void)bannerViewDidLoadAd:(ADBannerView *)banner
{
    [UIView beginAnimations:nil context:nil];
    
    [UIView setAnimationDuration:1];
    
    [banner setAlpha:1];
    
    [UIView commitAnimations];
}

-(void)bannerView:(ADBannerView *)banner didFailToReceiveAdWithError:(NSError *)error
{
    [UIView beginAnimations:nil context:nil];
    
    [UIView setAnimationDuration:1];
    
    [banner setAlpha:0];
    
    [UIView commitAnimations];
}

@end
