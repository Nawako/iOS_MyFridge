//
//  SugnUpViewController.m
//  MyFridge
//
//  Created by KISTNER Fabrice on 7/30/15.
//  Copyright (c) 2015 CCI. All rights reserved.
//

#import "SugnUpViewController.h"
#import "ProductListViewController.h"


@interface SugnUpViewController ()
{
    ProductListViewController *objProductListViewController;
}
@end

@implementation SugnUpViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    //******** To curve the edges and and make border arouncd cell ********//
    [self.userImageView.layer setCornerRadius:10.0f];
    self.userImageView.layer.borderColor = [UIColor lightGrayColor].CGColor;
    self.userImageView.layer.borderWidth = 0.50f;
    [self.userImageView.layer setMasksToBounds:YES];

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

//*************==================*******************//
//******* Register Bttn Tpd ***********************//
//*************==================*****************//
- (IBAction)BackButtonTpd:(id)sender
{
    [self.navigationController popViewControllerAnimated:YES];
}

- (IBAction)RegisterBttnTpd:(id)sender
{
    
    // Uncomment the following code when connecting with API's
    /*
    if ([self.enterPasswordTxtFeild.text length] <= 5)
    {
        
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Message" message:@"Le mot de passe doit contenir au minimum 6 caractères" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
        
        [alert show];
    }
    
    else if ([self.enterPasswordTxtFeild.text isEqualToString:self.reEnterPasswordTxtFeild.text])
    {
        
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Message" message:@"Les mots de passes ne correspondent pas" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
        
        [alert show];
    }
    
    else if (![self validateMail:self.eMailTxtFeild.text])
    {
        
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Message" message:@"Adresse mail invalide" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
        [alert show];
    }
     
     else
     
     {
        //push product listing viewcontroller here
     }
    */
    
    objProductListViewController = [[ProductListViewController alloc] initWithNibName:@"ProductListViewController" bundle:nil];
    [self.navigationController pushViewController:objProductListViewController animated:YES];
}

//*************==================*******************//
//******* Upload image in image view **************//
//*************==================*****************//
- (IBAction)UploadImageBttnTpd:(id)sender
{
    [self selectPhotos];
}

//*************==================*******************//
//************= Validate eMail =*******************//
//*************==================*****************//
// This will check whether the eMail entered is valid or not //
// Uncomment the following code when connecting with API's
/*
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
*/
//--------------------------------------------------------//
//------------- Accessing the Photo Library --------------//
//--------------------------------------------------------//


- (IBAction)selectPhotos
{
    UIImagePickerController *picker = [[UIImagePickerController alloc] init];
    picker.sourceType = UIImagePickerControllerSourceTypeSavedPhotosAlbum;
    picker.delegate = self;
    [self presentViewController:picker animated:YES  completion:nil];
}

- (void)imagePickerController:(UIImagePickerController *)picker
        didFinishPickingImage:(UIImage *)image
                  editingInfo:(NSDictionary *)editingInfo
{
    self.userImageView.image = image;
    [[picker parentViewController] dismissViewControllerAnimated:YES completion:nil];
}

- (IBAction)saveImage:(id)sender
{
    if(self.userImageView.image)
    {
        UIImageWriteToSavedPhotosAlbum(self.userImageView.image, self, @selector(finishUIImageWriteToSavedPhotosAlbum:didFinishSavingWithError:contextInfo:), nil);
    }
}

- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info;
{
    // Get the picture from the camera
    
    UIImage *imageFromCamera = [info objectForKey:UIImagePickerControllerOriginalImage];
    
    UIImage *resizedImage = [self imageWithImage:imageFromCamera scaledToWidth:imageFromCamera.size.width];
    
    self.userImageView.image= resizedImage;
    
    [picker dismissViewControllerAnimated:YES completion:nil];
}

- (UIImage*)resize:(UIImage*)image to:(CGSize)newSize
{
    UIGraphicsBeginImageContextWithOptions(newSize, NO, 0.0);
    [image drawInRect:CGRectMake(0, 0, newSize.width, newSize.height)];
    UIImage *newImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return newImage;
}

- (UIImage*)imageWithImage: (UIImage*) sourceImage scaledToWidth: (float) i_width
{
    float oldWidth = sourceImage.size.width;
    float scaleFactor = i_width / oldWidth;
    
    float newHeight = sourceImage.size.height * scaleFactor;
    float newWidth = oldWidth * scaleFactor;
    
    UIGraphicsBeginImageContext(CGSizeMake(newWidth, newHeight));
    [sourceImage drawInRect:CGRectMake(0, 0, newWidth, newHeight)];
    UIImage *newImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return newImage;
}


@end
