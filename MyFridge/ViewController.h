//
//  ViewController.h
//  MyFridge
//
//  Created by KISTNER Fabrice on 7/30/15.
//  Copyright (c) 2015 CCI. All rights reserved.//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController

- (IBAction)LoginBttnTpd:(id)sender;
- (IBAction)SignUpBttnTpd:(id)sender;
- (IBAction)ForgotPasswordBttnTpd:(id)sender;


@property (weak, nonatomic) IBOutlet UITextField *userNameTxtFeild;
@property (weak, nonatomic) IBOutlet UITextField *passwordTextFeild;

@end

