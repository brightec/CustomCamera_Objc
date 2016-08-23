//
//  ViewController.m
//  Custom Camera
//
//  Created by Chris Leversuch on 30/06/2016.
//  Copyright © 2016 Brightec. All rights reserved.
//

#import "ViewController.h"
#import "CameraViewController.h"
#import "ImageViewerViewController.h"


@interface ViewController () <UINavigationControllerDelegate, UIImagePickerControllerDelegate>
@end


@implementation ViewController


- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}


- (void)showNativeCamera
{
    if (![UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera]) {
        [self showNoCameraError];
        return;
    }

    UIImagePickerController *imagePickerController = [[UIImagePickerController alloc] init];
    imagePickerController.sourceType = UIImagePickerControllerSourceTypeCamera;
    imagePickerController.delegate = self;

    [self presentViewController:imagePickerController animated:YES completion:nil];
}


- (void)showCustomCamera
{
    if (![UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera]) {
        [self showNoCameraError];
        return;
    }

    CameraViewController *cameraViewController = [[CameraViewController alloc] init];
    [self presentViewController:cameraViewController animated:YES completion:nil];
}


- (void)showNoCameraError
{
    UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"Error" message:@"Your device doesn't have a camera" preferredStyle:UIAlertControllerStyleAlert];
    [alertController addAction:[UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault handler:nil]];
    [self presentViewController:alertController animated:YES completion:nil];
}


#pragma mark -
#pragma mark Actions

- (IBAction)showNativeCameraButtonWasTouched:(UIButton *)sender
{
    [self showNativeCamera];
}


- (IBAction)showCustomCameraButtonWasTouched:(UIButton *)sender
{
    [self showCustomCamera];
}


- (void)doneBarButtonWasTouched:(UIBarButtonItem *)sender
{
    [self dismissViewControllerAnimated:YES completion:nil];
}


#pragma mark -
#pragma mark UIImagePickerControllerDelegate

- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary<NSString *,id> *)info
{
    UIImage *image = info[UIImagePickerControllerOriginalImage];

    [self dismissViewControllerAnimated:YES completion:^{
        ImageViewerViewController *viewController = [[ImageViewerViewController alloc] initWithImage:image];
        viewController.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemDone target:self action:@selector(doneBarButtonWasTouched:)];

        UINavigationController *navController = [[UINavigationController alloc] initWithRootViewController:viewController];
        [self presentViewController:navController animated:YES completion:nil];
    }];
}


- (void)imagePickerControllerDidCancel:(UIImagePickerController *)picker
{
    [self dismissViewControllerAnimated:YES completion:nil];
}


@end
