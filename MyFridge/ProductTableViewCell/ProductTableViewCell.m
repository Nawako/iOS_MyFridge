//
//  ProductTableViewCell.m
//  MyFridge
//
//  Created by KISTNER Fabrice on 7/30/15.
//  Copyright (c) 2015 CCI. All rights reserved.
//

#import "ProductTableViewCell.h"

@implementation ProductTableViewCell

- (void)awakeFromNib
{
    // Init
    //******** To curve the edges and and make border around cell ********//
    
    [self.innerView.layer setCornerRadius:10.0f];
    self.innerView.layer.borderColor = [UIColor lightGrayColor].CGColor;
    self.innerView.layer.borderWidth = 0.50f;
    [self.innerView.layer setMasksToBounds:YES];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
