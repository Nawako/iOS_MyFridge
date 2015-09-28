//
//  ViewController.m
//  MyFridge
//
//  Created by KISTNER Fabrice on 7/30/15.
//  Copyright (c) 2015 CCI. All rights reserved.
//

#import "ViewController.h"
#import "SugnUpViewController.h"
#import "ProductListViewController.h"
#import "ForgotPasswordViewController.h"


@interface ViewController ()
{
    SugnUpViewController *objSugnUpViewController;
    ProductListViewController *objProductListViewController;
    ForgotPasswordViewController *objForgotPasswordViewController;

}
@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)LoginBttnTpd:(id)sender
{
    objProductListViewController = [[ProductListViewController alloc] initWithNibName:@"ProductListViewController" bundle:nil];
    [self.navigationController pushViewController:objProductListViewController animated:YES];

}

- (IBAction)SignUpBttnTpd:(id)sender
{
    objSugnUpViewController = [[SugnUpViewController alloc] initWithNibName:@"SugnUpViewController" bundle:nil];
    [self.navigationController pushViewController:objSugnUpViewController animated:YES];

}

- (IBAction)ForgotPasswordBttnTpd:(id)sender
{
    objForgotPasswordViewController = [[ForgotPasswordViewController alloc] initWithNibName:@"ForgotPasswordViewController" bundle:nil];
    [self.navigationController pushViewController:objForgotPasswordViewController animated:YES];
    
}
@end
