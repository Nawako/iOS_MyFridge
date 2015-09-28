/*
 * This file is part of the SDWebImage package.
 * (c) Olivier Poitrey <rs@dailymotion.com>
 *
 * For the full copyright and license information, please view the LICENSE
 * file that was distributed with this source code.
 */

#import "UIImageView+WebCache.h"

@implementation UIImageView (WebCache)

- (void)setImageWithURL:(NSURL *)url
{
    
    UIActivityIndicatorView* activity = [[UIActivityIndicatorView alloc]initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleGray];
    activity.center = CGPointMake(self.frame.size.width/2,self.frame.size.height/2) ;
    [self addSubview:activity];
    [activity startAnimating];
    
    [self setImageWithURL:url placeholderImage:nil];
    [self bringSubviewToFront:activity];
    
    
    
}



- (void)setImageWithURL:(NSURL *)url placeholderImage:(UIImage *)placeholder
{
    [self setImageWithURL:url placeholderImage:placeholder options:0];
}

- (void)setImageWithURL:(NSURL *)url placeholderImage:(UIImage *)placeholder options:(SDWebImageOptions)options
{
    SDWebImageManager *manager = [SDWebImageManager sharedManager];

    // Remove in progress downloader from queue
    [manager cancelForDelegate:self];

    self.image = placeholder;

    if (url)
    {
        [manager downloadWithURL:url delegate:self options:options];
    }
}

- (void)cancelCurrentImageLoad
{
    [[SDWebImageManager sharedManager] cancelForDelegate:self];
}

- (void)webImageManager:(SDWebImageManager *)imageManager didFinishWithImage:(UIImage *)image
{
    self.image = image;
    
    NSArray* viewsInside = [self subviews];
    for (UIView* view in viewsInside) {
        if ([view isKindOfClass:[UIActivityIndicatorView class]]) {
            [view removeFromSuperview];
        }
    }
    
}


- (void)webImageManager:(SDWebImageManager *)imageManager didFailWithError:(NSError *)error
{
    //self.image = [UIImage imageNamed:@"cameraImageBg.png"];
    NSArray* viewsInside = [self subviews];
    for (UIView* view in viewsInside) {
        if ([view isKindOfClass:[UIActivityIndicatorView class]]) {
            [view removeFromSuperview];
        }
    }
}


@end
