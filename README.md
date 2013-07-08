MMInstagramWrapper
==================

Small wrapper class for posting images to Instagram on iOS

<b>Usage:</b>
```objc

UIImage *image = ...;     //Image to post
NSString *caption = ...;  //Caption to post with image (user an modify)
CGRect rect = ...;        //Rect on screen to show Document Interaction Controller from
UIView *view = ...;       //View rect is in

MMInstagramWrapper *instagramWrapper = [[MMInstagramWrapper alloc] init];
[instagramWrapper postImagetoInstagram:image withCaption:caption presentOpenInMenuFromRect:rect inView:view];


```
