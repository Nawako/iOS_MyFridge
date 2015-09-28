//
//  ForgotPasswordViewController.h
//  MyFridge
//
//  Created by KISTNER Fabrice on 7/30/15.
//  Copyright (c) 2015 CCI. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ForgotPasswordViewController : UIViewController

- (IBAction)RetreivePasswordBttntpd:(id)sender;
- (IBAction)CancelBttnTpd:(id)sender;
@property (weak, nonatomic) IBOutlet UITextField *eMailTextFeild;
@property (weak, nonatomic) IBOutlet UIView *innerView;

@end
