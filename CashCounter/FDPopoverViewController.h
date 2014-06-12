//
//  FDPopoverViewController.h
//  CashCounter
//
//  Created by Daniel Fairbanks on 6/11/14.
//  Copyright (c) 2014 Fairbanksdan. All rights reserved.
//

#import <UIKit/UIKit.h>


@protocol FDPopoverViewControllerDelegate <NSObject>

@end

@interface FDPopoverViewController : UIViewController

@property (nonatomic, unsafe_unretained) id<FDPopoverViewControllerDelegate> delegate;

@end

