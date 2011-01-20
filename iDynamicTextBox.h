//
//  iDynamicTextBox.h
//  Part of iDynamicTextBox at https://github.com/inkscribbles/iDynamicTextBox
//
//  Created by tim on 20/01/11.
//  Copyright 2011 Ink Scribbles Pty Ltd. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "iNternalTextBox.h"

@class iDynamicTextBox;

@protocol iDynamicTextDelegate

@optional
- (void)textBox:(iDynamicTextBox*)textBox didResizeWith:(float)heightChange;
- (void)textBox:(iDynamicTextBox*)textBox textDidChange:(NSString*)text;
@end


@interface iDynamicTextBox : UIView <UITextViewDelegate> {
	
	iNternalTextBox *textEntryBox;
	UIImageView *bg;
	
	int minimumLines;
	int maximumLines;
	
	int maxHeight;
	int minHeight;
	
	id delegate;
	
	NSString *text;
	BOOL editable;
	
}

@property int minimumLines;
@property int maximumLines;

@property (nonatomic, retain) UITextView *textEntryBox;
@property (nonatomic, retain) UIImageView *bg;

@property (assign) id delegate;
@property (nonatomic, assign) NSString *text;
@property (nonatomic, assign) BOOL editable;

- (void)setBackgroundImg:(NSString*)fileName;
- (void)setBackgroundImg:(NSString*)fileName:(int)leftCapWidth:(int)topCapHeight;

- (void)scaleBox:(float)heightChange;
- (int)calcHeight:(int)lines;

@end
