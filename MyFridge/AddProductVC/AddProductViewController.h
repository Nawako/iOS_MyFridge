//
//  AddProductViewController.h
//  MyFridge
//
//  Created by KISTNER Fabrice on 7/30/15.
//  Copyright (c) 2015 CCI. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AddProductViewController : UIViewController<UITextFieldDelegate, UIImagePickerControllerDelegate>
@property (weak, nonatomic) IBOutlet UITextField *bestBeforeDateTextFeild;

@property (weak, nonatomic) IBOutlet UITextField *enterProductNameTextFeild;
@property (weak, nonatomic) IBOutlet UIView *innerView;

@property (weak, nonatomic) IBOutlet UIImageView *productImage;

- (IBAction)AddbttnTpd:(id)sender;

- (IBAction)CancelBttnTpd:(id)sender;

- (IBAction)BestBeforeDateBttnTpd:(id)sender;
- (IBAction)AddProductImageBttnTpd:(id)sender;

@end
