//
//  SugnUpViewController.h
//  MyFridge
//
//  Created by KISTNER Fabrice on 7/30/15.
//  Copyright (c) 2015 CCI. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SugnUpViewController : UIViewController<UITextFieldDelegate, UIImagePickerControllerDelegate>


@property (weak, nonatomic) IBOutlet UITextField *firstNameTxtFeild;
@property (weak, nonatomic) IBOutlet UITextField *lastNameTxtFeild;
@property (weak, nonatomic) IBOutlet UITextField *eMailTxtFeild;
@property (weak, nonatomic) IBOutlet UITextField *phoneNumberTxtFeild;
@property (weak, nonatomic) IBOutlet UITextField *enterPasswordTxtFeild;
@property (weak, nonatomic) IBOutlet UITextField *reEnterPasswordTxtFeild;
@property (weak, nonatomic) IBOutlet UIImageView *userImageView;


- (IBAction)BackButtonTpd:(id)sender;

- (IBAction)RegisterBttnTpd:(id)sender;

- (IBAction)UploadImageBttnTpd:(id)sender;
@end
