//
//  ForgotPasswordViewController.m
//  MyFridge
//
//  Created by KISTNER Fabrice on 7/30/15.
//  Copyright (c) 2015 CCI. All rights reserved.
//

#import "ForgotPasswordViewController.h"

@interface ForgotPasswordViewController ()

@end

@implementation ForgotPasswordViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    //******** To curve the edges and and make border arouncd cell ********//
    [self.innerView.layer setCornerRadius:20.0f];
    //self.innerView.layer.borderColor = [UIColor lightGrayColor].CGColor;
    //self.innerView.layer.borderWidth = 1.0f;
    [self.innerView.layer setMasksToBounds:YES];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



//*************==================*******************//
//************= Validate eMail =*******************//
//*************==================*****************//
// This will check whether the eMail entered is valid or not //
// Uncomment the following code when connecting with API's

 - (BOOL)validateMail:(NSString *)email
 {
 
 NSString *pattern = @"^[_A-Za-z0-9-\\+]+(\\.[_A-Za-z0-9-]+)*@[A-Za-z0-9-]+(\\.[A-Za-z0-9]+)*(\\.[A-Za-z]{2,})$";
 
 NSRegularExpression *regex = [NSRegularExpression regularExpressionWithPattern:pattern options:NSRegularExpressionCaseInsensitive error:NULL];
 
 NSTextCheckingResult *match = [regex firstMatchInString:email options:0 range:NSMakeRange(0, [email length])];
 
 if (match)
 {
 
 return YES;
 
 }
 
 else
 {
 
 return NO;
 
 }
 
 }
 


- (IBAction)RetreivePasswordBttntpd:(id)sender
{
    UIAlertView *message = [[UIAlertView alloc] initWithTitle:@"Message" message:@"Votre mot de passe a été envoyé sur votre adresse mail" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
    [message show];
    [self.navigationController popViewControllerAnimated:YES];

}

- (IBAction)CancelBttnTpd:(id)sender
{

    [self.navigationController popViewControllerAnimated:YES];
}
@end
