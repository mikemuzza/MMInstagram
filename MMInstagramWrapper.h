//
//  MMInstragramWrapper.h
//
//  Created by Michael Murray on 6/5/13.
//  Copyright (c) 2013 Temp. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MMInstragramWrapper : NSObject

- (void)postImagetoInstagram:(UIImage*)image withCaption:(NSString*)caption presentOpenInMenuFromRect:(CGRect)rect inView:(UIView*)sourceView;

@end
