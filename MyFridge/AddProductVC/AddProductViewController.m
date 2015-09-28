//
//  AddProductViewController.m
//  MyFridge
//
//  Created by KISTNER Fabrice on 7/30/15.
//  Copyright (c) 2015 CCI. All rights reserved.
//

#import "AddProductViewController.h"

@interface AddProductViewController ()
{
    UIDatePicker *datePicker;
}
@end

@implementation AddProductViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    //******** To curve the edges and and make border arouncd cell ********//
    [self.innerView.layer setCornerRadius:20.0f];
    //self.innerView.layer.borderColor = [UIColor lightGrayColor].CGColor;
    //self.innerView.layer.borderWidth = 1.0f;
    [self.innerView.layer setMasksToBounds:YES];
    
    
    //******** To curve the edges and and make border arouncd Uiimage view ********//
    [self.productImage.layer setCornerRadius:10.0f];
    self.productImage.layer.borderColor = [UIColor lightGrayColor].CGColor;
    self.productImage.layer.borderWidth = 0.50f;
    [self.productImage.layer setMasksToBounds:YES];

    [self SetPickerForFields];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)AddbttnTpd:(id)sender
{
    UIAlertView *message = [[UIAlertView alloc]initWithTitle:@"Message" message:@"Le produit a été ajouté avec succès" delegate:nil cancelButtonTitle:@"Ok" otherButtonTitles:nil];
    [message show];
  
    [self.navigationController popViewControllerAnimated:YES];

}

- (IBAction)CancelBttnTpd:(id)sender
{
    [self.navigationController popViewControllerAnimated:YES];
}

- (IBAction)BestBeforeDateBttnTpd:(id)sender
{
}

- (IBAction)AddProductImageBttnTpd:(id)sender
{
    [self selectPhotos];
}

//--------------------------------------------------------//
//------------- Date Picker Methods ----------------------//
//--------------------------------------------------------//

-(BOOL)textFieldShouldReturn:(UITextField*)textField
{
    NSInteger nextTag = textField.tag + 1;
    // Try to find next responder
    UIResponder* nextResponder = [textField.superview viewWithTag:nextTag];
    if (nextResponder) {
        // Found next responder, so set it.
        [nextResponder becomeFirstResponder];
    } else {
        // Not found, so remove keyboard.
        [textField resignFirstResponder];
    }
    return NO; // We do not want UITextField to insert line-breaks.
}

- (void)SetPickerForFields
{
    
    UIToolbar *toolbar = [[UIToolbar alloc] init];
    [toolbar setBarStyle:UIBarStyleBlack];
    [toolbar setBarTintColor:[UIColor colorWithRed: 23.0/255.0 green:129.0/255.0 blue:207.0/255.0 alpha:0.8]];
    [toolbar sizeToFit];
    UIBarButtonItem *flexButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace target:self action:nil];
    UIBarButtonItem *doneButton =[[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemDone target:self action:@selector(resignKeyboard)];
    
    doneButton.tintColor = [UIColor whiteColor];
    
    NSArray *itemsArray = [NSArray arrayWithObjects:flexButton, doneButton, nil];
    [toolbar setItems:itemsArray];
    
    
    self.bestBeforeDateTextFeild.inputAccessoryView = toolbar;
    //1st
    datePicker = [[UIDatePicker alloc]initWithFrame:CGRectMake(0, 210, 320, 216)];
    datePicker.datePickerMode = UIDatePickerModeDate;
    datePicker.backgroundColor = [UIColor whiteColor];
    self.bestBeforeDateTextFeild.inputView = datePicker;
    [datePicker addTarget:self action:@selector(dateChanged:)
         forControlEvents:UIControlEventValueChanged];
    datePicker.tag = self.bestBeforeDateTextFeild.tag;
    
    self.bestBeforeDateTextFeild.inputAccessoryView = toolbar;
   
}


- (void)dateChanged:(UIDatePicker*)pickerView
{
    switch (pickerView.tag)
    {
        case 1:
        {
            // date picker
            NSString* formattedDate = [self FormatDate:pickerView.date];
            self.bestBeforeDateTextFeild.text = formattedDate;
            break;
        }

            
        default:
            break;
    }
}

-(NSString*)FormatDate:(NSDate*)date
{
    NSDateFormatter *dateformate=[[NSDateFormatter alloc]init];
    [dateformate setDateFormat:@"yyyy-MM-dd"]; // Date formater
    NSString *dateString = [dateformate stringFromDate:date]; // Convert date to string
    NSLog(@"date :%@",dateString);
    return  dateString;
}



- (void)resignKeyboard
{
    [self.bestBeforeDateTextFeild resignFirstResponder];
    
}

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
    self.productImage.image = image;
    [[picker parentViewController] dismissViewControllerAnimated:YES completion:nil];
}

- (IBAction)saveImage:(id)sender
{
    if(self.productImage.image)
    {
        UIImageWriteToSavedPhotosAlbum(self.productImage.image, self, @selector(finishUIImageWriteToSavedPhotosAlbum:didFinishSavingWithError:contextInfo:), nil);
    }
}

- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info;
{
    // Get the picture from the camera
    
    UIImage *imageFromCamera = [info objectForKey:UIImagePickerControllerOriginalImage];
    
    UIImage *resizedImage = [self imageWithImage:imageFromCamera scaledToWidth:imageFromCamera.size.width];
    
    self.productImage.image= resizedImage;
    
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
