//
//  FDViewController.h
//  CashCounter
//
//  Created by Daniel Fairbanks on 4/28/14.
//  Copyright (c) 2014 Fairbanksdan. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface FDViewController : UIViewController

@property (weak, nonatomic) IBOutlet UITextField *pennyTextField;
@property (weak, nonatomic) IBOutlet UITextField *nickelTextField;
@property (weak, nonatomic) IBOutlet UITextField *dimeTextField;
@property (weak, nonatomic) IBOutlet UITextField *quarterTextField;
@property (weak, nonatomic) IBOutlet UITextField *fiftyCentTextField;
@property (weak, nonatomic) IBOutlet UITextField *singleDollarTextField;
@property (weak, nonatomic) IBOutlet UITextField *twoDollarTextField;
@property (weak, nonatomic) IBOutlet UITextField *fiveDollarTextField;
@property (weak, nonatomic) IBOutlet UITextField *tenDollarTextField;
@property (weak, nonatomic) IBOutlet UITextField *twentyDollarTextField;
@property (weak, nonatomic) IBOutlet UITextField *fiftyDollarTextField;
@property (weak, nonatomic) IBOutlet UITextField *hundredDollarTextField;

@property (weak, nonatomic) IBOutlet UILabel *pennyTotalLabel;
@property (weak, nonatomic) IBOutlet UILabel *nickelTotalLabel;
@property (weak, nonatomic) IBOutlet UILabel *dimeTotalLabel;
@property (weak, nonatomic) IBOutlet UILabel *quarterTotalLabel;
@property (weak, nonatomic) IBOutlet UILabel *fiftyCentTotalLabel;
@property (weak, nonatomic) IBOutlet UILabel *singleDollarTotalLabel;
@property (weak, nonatomic) IBOutlet UILabel *twoDollarTotalLabel;
@property (weak, nonatomic) IBOutlet UILabel *fiveDollarTotalLabel;
@property (weak, nonatomic) IBOutlet UILabel *tenDollarTotalLabel;
@property (weak, nonatomic) IBOutlet UILabel *twentyDollarTotalLabel;
@property (weak, nonatomic) IBOutlet UILabel *fiftyDollarTotalLabel;
@property (weak, nonatomic) IBOutlet UILabel *hundredDollarTotalLabel;
@property (weak, nonatomic) IBOutlet UILabel *GrandTotalLabel;

@property (weak, nonatomic) IBOutlet UIButton *resetButton;

-(BOOL)textFieldShouldReturn:(UITextField *)textField;



@end
