//
//  PhotoUploadViewController.h
//  Quippic
//
//  Created by David Kay on 10/22/11.
//  Copyright 2011 Gargoyle Software. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PhotoUploadViewController : UIViewController <UIImagePickerControllerDelegate, UINavigationControllerDelegate>

// Public Methods -- visible to the whole world

// We have to say IBAction because we're bridging code to interface builder
- (IBAction)pickPhotoButtonWasPressed:(id)sender;
- (IBAction)uploadButtonWasPressed:(id)sender;

// We have to say IBOutlet because we're bridging code to interface builder
@property (nonatomic, retain) IBOutlet UIImageView *imageView;

@end
