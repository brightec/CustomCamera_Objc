//
//  ImageViewerViewController.m
//  Custom Camera
//
//  Created by Chris Leversuch on 30/06/2016.
//  Copyright © 2016 Brightec. All rights reserved.
//

#import "ImageViewerViewController.h"


@interface ImageViewerViewController ()
@property (weak, nonatomic) IBOutlet UIImageView *imageView;
@property (strong, nonatomic) UIImage *image;
@end


@implementation ImageViewerViewController


- (instancetype)initWithImage:(UIImage *)image
{
    self = [super init];
    if (self) {
        _image = image;
    }
    return self;
}


- (void)viewDidLoad
{
    [super viewDidLoad];

    self.imageView.image = self.image;
}


@end
