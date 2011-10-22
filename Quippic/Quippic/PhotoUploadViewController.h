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

- (IBAction)pickPhotoButtonWasPressed:(id)sender;

@end
