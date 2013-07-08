//
//  MMInstragramWrapper.m
//
//  Created by Michael Murray on 6/5/13.
//  Copyright (c) 2013 Temp. All rights reserved.
//


static NSString *const kInstagramCommentKey = @"InstagramCaption";
static NSString *const kInstagramUTI        = @"com.instagram.exclusivegram";
static CGFloat const kInstagramImageSize    = 612.0;
 
@interface MMInstragramWrapper () <UIDocumentInteractionControllerDelegate>
 
@property (nonatomic, strong) UIDocumentInteractionController *documentInteractionController;
 
@end
 
@implementation MMInstragramWrapper
 
- (void)postImagetoInstagram:(UIImage*)image withCaption:(NSString*)caption presentOpenInMenuFromRect:(CGRect)rect inView:(UIView*)sourceView
{
  //Get file path for new .igo file
  NSString *instagramFileName = [[@"instagram" stringByDeletingPathExtension] stringByAppendingString:@".igo"];
  NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
  NSString *documentsPath = [paths objectAtIndex:0]; //Get the docs directory
  NSString *instagramFilePath = [documentsPath stringByAppendingPathComponent:instagramFileName];
    
  //Resize image to 612 x 612 (min required by instagram)
  UIGraphicsBeginImageContext(CGSizeMake(kInstagramImageSize, kInstagramImageSize));
  [image drawInRect:CGRectMake(0,0,kInstagramImageSize,kInstagramImageSize)];
  UIImage* instagramImage = UIGraphicsGetImageFromCurrentImageContext();
  UIGraphicsEndImageContext();
    
  //Save to disk
  BOOL savedSuccess = [UIImagePNGRepresentation(instagramImage) writeToFile:instagramFilePath atomically:YES];
    
  //If successfully saved
  if (savedSuccess)
    {
      //Create document controller with instagram file
      self.documentInteractionController = [UIDocumentInteractionController interactionControllerWithURL:[NSURL fileURLWithPath:instagramFilePath]];
      UIDocumentInteractionController *documentInteractionController = self.documentInteractionController;
      documentInteractionController.UTI = kInstagramUTI;
      documentInteractionController.annotation = @{kInstagramCommentKey:caption};
      [documentInteractionController presentOpenInMenuFromRect:rect inView:sourceView animated:YES];
    }
  else{
    NSLog(@"Error - Error saving instagram photo to disk");
  }
}
 
@end
