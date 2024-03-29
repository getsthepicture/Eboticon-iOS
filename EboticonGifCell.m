//
//  EboticonGifCell.m
//  Eboticon1.2
//
//  Created by Jarryd McCree on 4/10/14.
//  Copyright (c) 2014 Incling. All rights reserved.
//

#import "EboticonGifCell.h"
#import "GPUImage.h"
#import <DFImageManager/DFImageManagerKit.h>
#import "ImageDownloader.h"
#import "ImageCache.h"
#import "Reachability.h"



@implementation EboticonGifCell

@synthesize cellGif = _cellGif;
@synthesize gifImageView = _gifImageView;

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}

-(void) setCellGif:(EboticonGif *) eboticonGif
{
    //Reset Image to prevent prematurely loading images
    _gifImageView.image = nil;
    
    //Load image from cache or remotely
    if (nil != eboticonGif){
        _cellGif = eboticonGif;
        UIImage *image = [[UIImage alloc]init];
        if ([[ImageCache sharedImageCache] DoesExist:eboticonGif.stillUrl] == true) {
            image = [[ImageCache sharedImageCache] GetImage:eboticonGif.stillUrl];
            
            _gifImageView.alpha = 0.0;
            _gifImageView.image = image;
//            [self fadeInImage];


        }else {
            
//            UIActivityIndicatorView *activityIndicator = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleGray];
//            activityIndicator.hidesWhenStopped = YES;
//            activityIndicator.hidden = NO;
//            [activityIndicator startAnimating];
//            activityIndicator.center = CGPointMake(self.contentView.frame.size.width / 2, self.contentView.frame.size.height / 2);
//            activityIndicator.tag = 505;
//            [self.contentView addSubview:activityIndicator];
//            [activityIndicator startAnimating];
            
            if ([self checkConnnectivity]) {
                ImageDownloader *imgDownloader = [[ImageDownloader alloc] init];
                imgDownloader.imageRecord = eboticonGif;
                [imgDownloader setCompletionHandler:^{
                    
                    
//                    _gifImageView.alpha = 0.0;
                    _gifImageView.image = eboticonGif.thumbImage;
//                    [self fadeInImage];
                    

//                    [activityIndicator stopAnimating];
//                    [activityIndicator removeFromSuperview];
                }];
                [imgDownloader startDownload];
                
            }else {
//                [activityIndicator stopAnimating];
//                [activityIndicator removeFromSuperview];
                _gifImageView.image = [UIImage imageNamed:@"placeholder.png"];
            }
        }
    }
}

- (void) fadeInImage {
    [UIView animateWithDuration:0.25
                          delay:0.0
                        options:UIViewAnimationOptionCurveEaseIn
                     animations:^{ _gifImageView.alpha = 1; }
                     completion:^(BOOL finished){}
     ];
    
    
}

- (void)prepareForReuse {
    [super prepareForReuse];
    _gifImageView.image = nil;
}

- (BOOL) checkConnnectivity {
    
    Reachability *reachability = [Reachability reachabilityForInternetConnection];
    NetworkStatus internetStatus = [reachability currentReachabilityStatus];
    if (internetStatus != NotReachable) {
        return YES;
    }
    else {
        return NO;
    }
}

-(BOOL)isCellAnimating
{
    return _gifImageView.isAnimating;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

@end
