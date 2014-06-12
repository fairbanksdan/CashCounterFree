//
//  FDViewController.m
//  CashCounter
//
//  Created by Daniel Fairbanks on 4/28/14.
//  Copyright (c) 2014 Fairbanksdan. All rights reserved.
//

#import "FDViewController.h"
#import <QuartzCore/QuartzCore.h>
#import "UIImage+ImageEffects.h"

@interface FDViewController () <UITextFieldDelegate,UIGestureRecognizerDelegate,UIAlertViewDelegate>

@property (strong, nonatomic) NSString *str;

@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;

@property (strong,nonatomic) NSArray *textFields;

@property (strong, nonatomic) FDPopoverViewController *popoverVC;
@property (nonatomic, strong) UIImageView *snapShotView;

@property (nonatomic) BOOL smallScreen;

@end

@implementation FDViewController
{
    CGFloat _pennyCount;
    CGFloat _nickelCount;
    CGFloat _dimeCount;
    CGFloat _quarterCount;
    CGFloat _fiftyCentCount;
    
    CGFloat _singleDollarCount;
    CGFloat _twoDollarCount;
    CGFloat _fiveDollarCount;
    CGFloat _tenDollarCount;
    CGFloat _twentyDollarCount;
    CGFloat _fiftyDollarCount;
    CGFloat _hundredDollarCount;
    
    CGFloat _grandTotalCount;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.textFields = @[_pennyTextField,_nickelTextField,_dimeTextField,_quarterTextField,_fiftyCentTextField,_singleDollarTextField,_twoDollarTextField,_fiveDollarTextField,_tenDollarTextField,_twentyDollarTextField,_fiftyDollarTextField,_hundredDollarTextField];
    
    UITapGestureRecognizer *tapOutside = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(dismissKeyboard:)];
    [self.scrollView addGestureRecognizer:tapOutside];
    
    if (self.view.frame.size.height <= 480)
    {
        self.smallScreen = YES;
    }
    
    _pennyTextField.layer.borderColor=[[UIColor grayColor]CGColor];
    _pennyTextField.layer.borderWidth = 0.5;
    _nickelTextField.layer.borderColor=[[UIColor grayColor]CGColor];
    _nickelTextField.layer.borderWidth = 0.5;
    _dimeTextField.layer.borderColor=[[UIColor grayColor]CGColor];
    _dimeTextField.layer.borderWidth = 0.5;
    _quarterTextField.layer.borderColor=[[UIColor grayColor]CGColor];
    _quarterTextField.layer.borderWidth = 0.5;
    _fiftyCentTextField.layer.borderColor=[[UIColor grayColor]CGColor];
    _fiftyCentTextField.layer.borderWidth = 0.5;
    _singleDollarTextField.layer.borderColor=[[UIColor grayColor]CGColor];
    _singleDollarTextField.layer.borderWidth = 0.5;
    _twoDollarTextField.layer.borderColor=[[UIColor grayColor]CGColor];
    _twoDollarTextField.layer.borderWidth = 0.5;
    _fiveDollarTextField.layer.borderColor=[[UIColor grayColor]CGColor];
    _fiveDollarTextField.layer.borderWidth = 0.5;
    _tenDollarTextField.layer.borderColor=[[UIColor grayColor]CGColor];
    _tenDollarTextField.layer.borderWidth = 0.5;
    _twentyDollarTextField.layer.borderColor=[[UIColor grayColor]CGColor];
    _twentyDollarTextField.layer.borderWidth = 0.5;
    _fiftyDollarTextField.layer.borderColor=[[UIColor grayColor]CGColor];
    _fiftyDollarTextField.layer.borderWidth = 0.5;
    _hundredDollarTextField.layer.borderColor=[[UIColor grayColor]CGColor];
    _hundredDollarTextField.layer.borderWidth = 0.5;
}

- (BOOL)prefersStatusBarHidden
{
    return YES;
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
- (IBAction)fiftyCentCounter:(id)sender {
    _str = [_fiftyCentTextField text];
    
    _fiftyCentCount = [_str intValue]*0.5;
    
    [self Updatelabels];
}

- (IBAction)singleDollarCounter:(id)sender {
    _str = [_singleDollarTextField text];
    
    _singleDollarCount = [_str intValue];
    
    [self Updatelabels];
}

- (IBAction)twoDollarCounter:(id)sender {
    _str = [_twoDollarTextField text];
    
    _twoDollarCount = [_str intValue]*2;
    
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
    _grandTotalCount = _pennyCount+_nickelCount+_dimeCount+_quarterCount+_fiftyCentCount+_singleDollarCount+_twoDollarCount+_fiveDollarCount+_tenDollarCount+_twentyDollarCount+_fiftyDollarCount+_hundredDollarCount;
    
    NSNumberFormatter *currencyFormatter = [[NSNumberFormatter alloc] init];
    [currencyFormatter setNumberStyle:NSNumberFormatterCurrencyStyle];
    [currencyFormatter setCurrencySymbol:@" "];
    
    self.pennyTotalLabel.text = [NSString stringWithFormat:@"%@",[currencyFormatter stringFromNumber:[NSNumber numberWithFloat:_pennyCount]]];
    self.nickelTotalLabel.text = [NSString stringWithFormat:@"%@",[currencyFormatter stringFromNumber:[NSNumber numberWithFloat:_nickelCount]]];
    self.dimeTotalLabel.text = [NSString stringWithFormat:@"%@",[currencyFormatter stringFromNumber:[NSNumber numberWithFloat:_dimeCount]]];
    self.quarterTotalLabel.text = [NSString stringWithFormat:@"%@",[currencyFormatter stringFromNumber:[NSNumber numberWithFloat:_quarterCount]]];
    self.fiftyCentTotalLabel.text = [NSString stringWithFormat:@"%@",[currencyFormatter stringFromNumber:[NSNumber numberWithFloat:_fiftyCentCount]]];
    self.singleDollarTotalLabel.text = [NSString stringWithFormat:@"%@",[currencyFormatter stringFromNumber:[NSNumber numberWithFloat:_singleDollarCount]]];
    self.twoDollarTotalLabel.text = [NSString stringWithFormat:@"%@",[currencyFormatter stringFromNumber:[NSNumber numberWithFloat:_twoDollarCount]]];
    self.fiveDollarTotalLabel.text = [NSString stringWithFormat:@"%@",[currencyFormatter stringFromNumber:[NSNumber numberWithFloat:_fiveDollarCount]]];
    self.tenDollarTotalLabel.text = [NSString stringWithFormat:@"%@",[currencyFormatter stringFromNumber:[NSNumber numberWithFloat:_tenDollarCount]]];
    self.twentyDollarTotalLabel.text = [NSString stringWithFormat:@"%@",[currencyFormatter stringFromNumber:[NSNumber numberWithFloat:_twentyDollarCount]]];
    self.fiftyDollarTotalLabel.text = [NSString stringWithFormat:@"%@",[currencyFormatter stringFromNumber:[NSNumber numberWithFloat:_fiftyDollarCount]]];
    self.hundredDollarTotalLabel.text = [NSString stringWithFormat:@"%@",[currencyFormatter stringFromNumber:[NSNumber numberWithFloat:_hundredDollarCount]]];
    
    NSString *localCurrencySymbol = NSLocalizedString(@"happy", nil);
    self.GrandTotalLabel.text = [NSString stringWithFormat:@"%@%@", localCurrencySymbol,[currencyFormatter stringFromNumber:[NSNumber numberWithFloat:_grandTotalCount]]];
    
}

- (void)setCurrencySymbol:(NSString *)string
{
    string = [NSString stringWithFormat:@""];
}

#pragma mark Reset Button Method

- (IBAction)resetButton:(id)sender {
        
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Confirm Reset"
                                                    message:nil
                                                   delegate:self
                                          cancelButtonTitle:@"Cancel"
                                          otherButtonTitles:@"OK", nil];
    [alert show];
}

-(void)reset
{
    NSString *emptyString = [NSString stringWithFormat:@""];
    
    _pennyCount = 0;
    _nickelCount = 0;
    _dimeCount = 0;
    _quarterCount = 0;
    _fiftyCentCount = 0;
    _singleDollarCount = 0;
    _twoDollarCount = 0;
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
    self.fiftyCentTotalLabel.text = [NSString stringWithFormat:@"%.02f",_fiftyCentCount];
    self.singleDollarTotalLabel.text = [NSString stringWithFormat:@"%.02f",_singleDollarCount];
    self.twoDollarTotalLabel.text = [NSString stringWithFormat:@"%.02f",_twoDollarCount];
    self.fiveDollarTotalLabel.text = [NSString stringWithFormat:@"%.02f",_fiveDollarCount];
    self.tenDollarTotalLabel.text = [NSString stringWithFormat:@"%.02f",_tenDollarCount];
    self.twentyDollarTotalLabel.text = [NSString stringWithFormat:@"%.02f",_twentyDollarCount];
    self.fiftyDollarTotalLabel.text = [NSString stringWithFormat:@"%.02f",_fiftyDollarCount];
    self.hundredDollarTotalLabel.text = [NSString stringWithFormat:@"%.02f",_hundredDollarCount];
    
    NSString *localCurrencySymbol = NSLocalizedString(@"currencySymbol", nil);
    self.GrandTotalLabel.text = [NSString stringWithFormat:@"%@%.02f",localCurrencySymbol,_grandTotalCount];
    
    self.pennyTextField.text = emptyString;
    self.nickelTextField.text = emptyString;
    self.dimeTextField.text = emptyString;
    self.quarterTextField.text = emptyString;
    self.fiftyCentTextField.text = emptyString;
    self.singleDollarTextField.text = emptyString;
    self.twoDollarTextField.text = emptyString;
    self.fiveDollarTextField.text = emptyString;
    self.tenDollarTextField.text = emptyString;
    self.twentyDollarTextField.text = emptyString;
    self.fiftyDollarTextField.text = emptyString;
    self.hundredDollarTextField.text = emptyString;
    
    for (UITextField *textField in self.textFields)
    {
        [textField resignFirstResponder];
    }
}

- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{

    if (buttonIndex == 1)
    {
        [self reset];
    }
}

//- (BOOL)textField:(UITextField *)theTextField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string
//{
//    NSString *newText = [theTextField.text stringByReplacingCharactersInRange:range withString:string];
//    self.resetButton.enabled = newText.length > 0;
//    return YES;
//}

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
    NSInteger startPoint;
    NSInteger startPointTwo;
    NSInteger offset;
    NSInteger inset;
    
    if (self.smallScreen) {
        startPoint = 100;
        startPointTwo = 0;
        offset = 84;
        inset = 260;
        
    } else {
        startPoint = 170;
        startPointTwo = 0;
        offset = 151;
        inset = 265;
    }
    
    if (textField.frame.origin.y > startPoint)
    {
        [self.scrollView setContentOffset:CGPointMake(0, textField.frame.origin.y - offset) animated:YES];
    }
    
    if (textField.frame.origin.y > startPointTwo) {
        self.scrollView.contentInset = UIEdgeInsetsMake(0, 0, inset, 0);
    }
}

- (void)textFieldDidEndEditing:(UITextField *)textField
{
    [self.scrollView setContentOffset:CGPointMake(0, 0) animated:YES];
}



-(void)dismissKeyboard:(id)sender
{
    [UIView beginAnimations:nil context:NULL];
    [UIView setAnimationDuration:0.3];
    self.scrollView.contentInset = UIEdgeInsetsMake(0, 0, 0, 0);
    [UIView commitAnimations];
    
    for (UITextField *textField in self.textFields)
    {
        [textField resignFirstResponder];
    }
    
}
- (IBAction)infoButtonPressed:(UIButton *)sender {
    
    
    _popoverVC = [self.storyboard instantiateViewControllerWithIdentifier:@"PopoverVC"];
    
    UIButton *dismissButton = [[UIButton alloc] initWithFrame:_popoverVC.view.bounds];
    
    [self.view addSubview:_popoverVC.view];
    [_popoverVC.view addSubview:dismissButton];
    
    _popoverVC.view.frame = CGRectMake(0, 0, 320, 568);
    _popoverVC.view.center = CGPointMake(self.view.center.x, self.view.center.y - 500);
    self.view.backgroundColor = [UIColor colorWithWhite:0.f alpha:0.0];
    
    _snapShotView = [FDViewController snapshotForView:self.view.superview];
    _snapShotView.alpha = 0.f;
    
    [self.view addSubview:_snapShotView];
    [self.view addSubview:_popoverVC.view];
    
    [UIView animateWithDuration:0.4
                          delay:0.f
         usingSpringWithDamping:0.8
          initialSpringVelocity:0.4
                        options:UIViewAnimationOptionCurveEaseInOut
                     animations:^{
                         _popoverVC.view.center = self.view.center;
                         _snapShotView.alpha = 1.f;
                     } completion:^(BOOL finished) {
                         _popoverVC.delegate = self;
                         
                     }];
    [dismissButton addTarget:self action:@selector(dismissPopover:) forControlEvents:UIControlEventTouchUpInside];
    
    [_pennyTextField resignFirstResponder];
    [_nickelTextField resignFirstResponder];
    [_dimeTextField resignFirstResponder];
    [_quarterTextField resignFirstResponder];
    [_fiftyCentTextField resignFirstResponder];
    [_singleDollarTextField resignFirstResponder];
    [_twoDollarTextField resignFirstResponder];
    [_fiveDollarTextField resignFirstResponder];
    [_tenDollarTextField resignFirstResponder];
    [_twentyDollarTextField resignFirstResponder];
    [_fiftyDollarTextField resignFirstResponder];
    [_hundredDollarTextField resignFirstResponder];
}

- (void)dismissPopover:(id)sender
{
    [UIView animateWithDuration:0.8
                          delay:0.f
         usingSpringWithDamping:1.f
          initialSpringVelocity:1.f
                        options:UIViewAnimationOptionCurveEaseInOut
                     animations:^{
                         _popoverVC.view.center = CGPointMake(self.view.center.x, self.view.frame.size.height*2);
                         _snapShotView.alpha = 0.f;
                     } completion:^(BOOL finished) {
                         _popoverVC.delegate = nil;
                         [_popoverVC.view removeFromSuperview];
                         [_snapShotView removeFromSuperview];
                         _snapShotView = nil;
                         _popoverVC = nil;
                     }];
}

//Takes a snapshot of the View and adds a smoked glass window effect. Changing the "applyBlurWithRadius will change the how much the image is blured.
+ (UIImageView *)snapshotForView:(UIView *)view
{
    UIGraphicsBeginImageContextWithOptions(view.bounds.size, YES, 0.0f);
    CGContextRef context = UIGraphicsGetCurrentContext();
    [view.layer renderInContext:context];
    UIImage *snapshotImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    UIImageView *snapShotView = [[UIImageView alloc] initWithFrame:view.frame];
    UIColor *tintColor = [UIColor colorWithWhite:1.0 alpha:0.05];
    snapShotView.image = [snapshotImage applyBlurWithRadius:8 tintColor:tintColor saturationDeltaFactor:1.8 maskImage:nil];
    return snapShotView;
}

@end
