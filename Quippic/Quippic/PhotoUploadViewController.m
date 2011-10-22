//
//  PhotoUploadViewController.m
//  Quippic
//
//  Created by David Kay on 10/22/11.
//  Copyright 2011 Gargoyle Software. All rights reserved.
//

#import "PhotoUploadViewController.h"
//#import "NSDataAdditions.h"
#import "NSStringAdditions.h"

#define kImgrKey @"4e67917b2f3a114afec97677942a1698"

@implementation PhotoUploadViewController

@synthesize imageView;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)didReceiveMemoryWarning
{
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - HTTP String Escape

- (NSString *)escapeString:(NSString *)rawString {
    return [rawString stringByAddingPercentEscapesUsingEncoding: NSUTF8StringEncoding];
}

#pragma mark - Image Upload Methods

- (NSData *)uploadImageToImgur:(UIImage *) image {
    // Convert to binary JPEG format
    NSData   *imageData  = UIImageJPEGRepresentation(image,1);

    // Convert to ABCDE, base64 string encoding
    NSString *imageB64  = [NSString base64StringFromData: imageData
                                                  length: [imageData length]];
    // Escape any naughty characters for HTTP transfer
    NSString *escapedImageB64 = [self escapeString: imageB64];
    // Take the string representation, bundle with our developer API key
    NSString *uploadCall = [NSString stringWithFormat:@"key=%@&image=%@", kImgrKey, escapedImageB64];

    // Prepare the URL Request
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:[NSURL URLWithString:@"http://api.imgur.com/2/upload"]];
    [request setHTTPMethod:@"POST"];
    [request setValue:[NSString stringWithFormat:@"%d",[uploadCall length]] forHTTPHeaderField:@"Content-length"];
    [request setHTTPBody:[uploadCall dataUsingEncoding:NSUTF8StringEncoding]];

    NSURLResponse *response;
    NSError *error = nil;

    // Upload the image to imgur. Receive the response.
    NSData *XMLResponse = [NSURLConnection sendSynchronousRequest:request returningResponse:&response error:&error];

    return XMLResponse;
}

- (NSString *)uploadImage:(UIImage *)image {
    NSData * responseData = [self uploadImageToImgur: image];
    
    if (responseData == nil) {
        // something got borked
        return nil;
    } else {
        // Hooray! What did we get back?
        
        NSString *responseString = [[NSString alloc] initWithData:responseData encoding: NSUTF8StringEncoding];
        
        // Show the response in an alert on the screen.
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle: @"Success!" 
                                                        message: responseString
                                                       delegate: nil 
                                              cancelButtonTitle: @"OK" 
                                              otherButtonTitles: nil];
        [alert show];	
        [alert release];
        
        return responseString;
    }
}


#pragma mark - Button Listeners

- (IBAction)uploadButtonWasPressed:(id)sender {
    // fire the upload image call, using the image currently in our imageview
    
    [self uploadImage: self.imageView.image];
}

- (IBAction)pickPhotoButtonWasPressed:(id)sender {
    // Set up the image picker controller and add it to the view
	UIImagePickerController *imagePickerController = [[UIImagePickerController alloc] init];
    // Let the image picker know WHO to notify when the user touches something
	imagePickerController.delegate = self;
	imagePickerController.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;

    [self presentModalViewController: imagePickerController
                            animated: YES
                            ];
}

#pragma mark - Image Picker Methods

/**
 * The user picked an image from his photo gallery.
 */
- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingImage:(UIImage *)image editingInfo:(NSDictionary *)editingInfo
{
	// Dismiss the image selection, hide the picker and show the image view with the picked image
	[picker dismissModalViewControllerAnimated:YES];

	self.imageView.image = image;

	//imagePickerController.view.hidden = YES;
	//imageView.hidden = NO;
	//[window bringSubviewToFront:imageView];
}

/**
 * The user cancelled from the photo gallery.
 */
- (void)imagePickerControllerDidCancel:(UIImagePickerController *)picker
{
	// Dismiss the image selection and close the program
	[picker dismissModalViewControllerAnimated:YES];
	//exit(0);
}

#pragma mark - View lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.

}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

@end
