//
//  CoreDataViewController.h
//  CoreDataDemo
//
//  Created by andre trosky on 20/02/13.
//  Copyright (c) 2013 andre trosky. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AppDelegate.h"

@interface CoreDataViewController : UIViewController

@property (weak, nonatomic) IBOutlet UITextField *theName;
@property (weak, nonatomic) IBOutlet UITextField *theAddress;
@property (weak, nonatomic) IBOutlet UITextField *thePhone;
@property (weak, nonatomic) IBOutlet UILabel *theStatus;
@property (weak, nonatomic) IBOutlet UIButton *findButton;

- (IBAction)saveData:(UIButton *)sender;
- (IBAction)findContact:(UIButton *)sender;

- (IBAction)nameDone:(UITextField *)sender;
- (IBAction)addressDone:(UITextField *)sender;
- (IBAction)phoneDone:(UITextField *)sender;
@end
