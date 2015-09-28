//
//  ProductListViewController.h
//  MyFridge
//
//  Created by KISTNER Fabrice on 7/30/15.
//  Copyright (c) 2015 CCI. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ProductListViewController : UIViewController


@property (weak, nonatomic) IBOutlet UITableView *productListTableView;

- (IBAction)AddProductBttnTpd:(id)sender;

- (IBAction)LogOutBttnTpd:(id)sender;

@end
