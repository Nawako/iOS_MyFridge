//
//  ProductListViewController.m
//  MyFridge
//
//  Created by KISTNER Fabrice on 7/30/15.
//  Copyright (c) 2015 CCI. All rights reserved.
//

#import "ProductListViewController.h"
#import "ProductTableViewCell.h"
#import "AddProductViewController.h"


@interface ProductListViewController ()
{
    AddProductViewController *objAddProductViewController;

}
@end

@implementation ProductListViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (IBAction)AddProductBttnTpd:(id)sender
{
    
    objAddProductViewController = [[AddProductViewController alloc]initWithNibName:@"AddProductViewController" bundle:nil];
    [self.navigationController pushViewController:objAddProductViewController animated:YES];
    
}
- (IBAction)LogOutBttnTpd:(id)sender
{
    [self.navigationController popViewControllerAnimated:YES];
}

/*======================================================================================================*/
/*================================= Table view Delegate Methods ========================================*/
/*======================================================================================================*/

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSString* reuseIdentifier = @"ProductTableViewCell";
    
    ProductTableViewCell* cell = (ProductTableViewCell*)[tableView dequeueReusableCellWithIdentifier:reuseIdentifier];
    
    if (cell == nil)
    {
        cell = [self MakeCustomCellForIdentifier:reuseIdentifier];
    }
    
    
    return cell;
}


- (ProductTableViewCell*)MakeCustomCellForIdentifier:(NSString*)identifier
{
    NSArray *nibContents = [[NSBundle mainBundle] loadNibNamed:@"ProductTableViewCell"
                                                         owner:self
                                                       options:nil];
    
    //printf("[nibContents count] = %d\n", [nibContents count]);
    NSEnumerator *nibEnum = [nibContents objectEnumerator];
    ProductTableViewCell *cell = nil;
    NSObject *nibItem = nil;
    
    while((nibItem = [nibEnum nextObject]) != nil)
    {
        if([nibItem isKindOfClass:[ProductTableViewCell class]])
        {
            cell = (ProductTableViewCell *) nibItem;
            
            if([cell.reuseIdentifier isEqualToString:identifier])
            {
                break;
            }
            else
            {
                cell = nil;
            }
        }
    }
    
    return cell;
}

#pragma mark -UITableViewDelegate
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 150;
}

- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    return YES;
}

- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete)
    {
        
    }
}



@end
