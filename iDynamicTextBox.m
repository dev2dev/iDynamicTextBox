//
//  iDynamicTextBox.m
//  Part of iDynamicTextBox at https://github.com/inkscribbles/iDynamicTextBox
//
//  Created by tim on 20/01/11.
//  Copyright 2011 Ink Scribbles Pty Ltd. All rights reserved.
//

#import "iDynamicTextBox.h"


@implementation iDynamicTextBox

@synthesize minimumLines;
@synthesize maximumLines;

@synthesize textEntryBox;
@synthesize bg;
@synthesize delegate;
@synthesize text;
@synthesize editable;


- (id)initWithFrame:(CGRect)frame {
    if ((self = [super initWithFrame:frame])) {
        // Initialization code
		
		CGRect tFrame = frame;
		tFrame.origin.x = 0;
		tFrame.origin.y = 1;
		tFrame.size.height = frame.size.height - 2;
		
		textEntryBox = [[iNternalTextBox alloc] initWithFrame:tFrame];
		textEntryBox.delegate = self;
		textEntryBox.font = [UIFont fontWithName:@"Helvetica" size:13];
		textEntryBox.text = @"";
		textEntryBox.scrollEnabled = NO;
		textEntryBox.showsHorizontalScrollIndicator = NO;
		[textEntryBox setBackgroundColor:[UIColor clearColor]];
		
		[self addSubview:textEntryBox];
		
		[self setMinimumLines:1];
		[self setMaximumLines:0];
		
    }
    return self;
}

- (void)dealloc {
	[textEntryBox release];
	[super dealloc];
}

- (void)setMinimumLines:(int)ml {
	
	minHeight = [self calcHeight:ml];
	minimumLines = ml;
	
}

- (void)setMaximumLines:(int)ml {

	if (ml == 0) {
		maxHeight = 0;
	} else {
		maxHeight = [self calcHeight:ml];
	}
	maximumLines = ml;
}

- (void)setText:(NSString *)t {

	textEntryBox.text = t;
	
}

- (NSString*)text {
	
	return textEntryBox.text;
	
}

- (int)calcHeight:(int)lines {

	UITextView *tvTest = [[UITextView alloc] init];
	tvTest.font = textEntryBox.font;
	tvTest.hidden = YES;
	
	NSMutableString *testString = [NSMutableString string];
	[testString appendString:@"*"];
	for (int i=0; i<lines-1; i++) {
		[testString appendString:@"\n*"];
	}
	tvTest.text = testString;
	
	[self addSubview:tvTest];
	int tmpHeight = tvTest.contentSize.height;
	
	[tvTest removeFromSuperview];
	[tvTest release];
	
	return tmpHeight;
}

- (void)textViewDidChange:(UITextView *)textView
{

	int textHeight = textEntryBox.contentSize.height;
	
	//NSLog(@"%i", textHeight);
	
	if (textHeight < minHeight || [textEntryBox.text length] == 0) {
		textHeight = minHeight;
	}
	if (maxHeight > 0 && textHeight > maxHeight) {
		textHeight = maxHeight;
	}
	
	if (textHeight != textEntryBox.frame.size.height) {
		
		// We are resizing the textBox
		float heightChange = textHeight - textEntryBox.frame.size.height;
		
		//NSLog(@"Height change %f", heightChange);
		
		if (heightChange < 0) {
			
			// We are shrinking the size of the text box
			if (textHeight < maxHeight) {
				
				if (textEntryBox.scrollEnabled == YES) {
					textEntryBox.scrollEnabled = NO;
				}
			
				CGRect current = textEntryBox.frame;
				textEntryBox.frame = CGRectMake(current.origin.x, current.origin.y, current.size.width, textHeight);
				[self scaleBox:heightChange];
			}
			
		} else if (heightChange > 0) {
			
			if (textHeight == maxHeight) {
				textEntryBox.scrollEnabled = YES;
				[textEntryBox flashScrollIndicators];
			}
			
			CGRect current = textEntryBox.frame;
			textEntryBox.frame = CGRectMake(current.origin.x, current.origin.y, current.size.width, textHeight);
			[self scaleBox:heightChange];
		}
		
		if ([delegate respondsToSelector:@selector(textBox:didResizeWith:)]) {
			[delegate textBox:self didResizeWith:heightChange];
		}
	}
	if ([delegate respondsToSelector:@selector(textBox:textDidChange:)]) {
		[delegate textBox:self textDidChange:textEntryBox.text];
	}
}

- (void)scaleBox:(float)heightChange {
		
	if (bg != nil) {
		CGRect current = bg.frame;
		int newHeight = current.size.height + heightChange;
		bg.frame = CGRectMake(current.origin.x, current.origin.y, current.size.width, newHeight);
	}
	
	CGRect current = self.frame;
	int newHeight = current.size.height + heightChange;
	self.frame = CGRectMake(current.origin.x, current.origin.y, current.size.width, newHeight);
	
}

/**
 setBackgroundImg
 Sets the scalable background image that is stretched over the TextBox
 This method defaults to using an image with a topCapHeight of 13px
 fileName should be the path to an image within the bundle
 */
- (void)setBackgroundImg:(NSString*)fileName {
	
	UIImage *bgUiImage = [UIImage imageNamed:fileName];
	
	UIImage *bgImg = [bgUiImage stretchableImageWithLeftCapWidth:0 topCapHeight:13];
		
	bg = [[[UIImageView alloc] initWithImage:bgImg] autorelease];
	
	bg.frame = CGRectMake(0, 0, self.frame.size.width, self.frame.size.height);
	
	[self insertSubview:bg atIndex:0];
	
}

/**
 setBackgroundImg
 Sets the scalable background image that is stretched over the TextBox
 This method accepts a custom leftCapWidth and topCapHeight
 fileName should be the path to an image within the bundle
 */
- (void)setBackgroundImg:(NSString*)fileName:(int)leftCapWidth:(int)topCapHeight {

	UIImage *bgUiImage = [UIImage imageNamed:fileName];
	
	UIImage *bgImg = [bgUiImage stretchableImageWithLeftCapWidth:leftCapWidth topCapHeight:topCapHeight];
	
	bg = [[[UIImageView alloc] initWithImage:bgImg] autorelease];
	
	bg.frame = CGRectMake(0, 0, self.frame.size.width, self.frame.size.height);
	
	[self insertSubview:bg atIndex:0];
	
}

@end
