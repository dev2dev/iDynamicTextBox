//
//  iNternalTextBox.m
//  Part of iDynamicTextBox at https://github.com/inkscribbles/iDynamicTextBox
//
//  Created by tim on 20/01/11.
//  Copyright 2011 Ink Scribbles Pty Ltd. All rights reserved.
//

#import "iNternalTextBox.h"


@implementation iNternalTextBox


- (id)initWithFrame:(CGRect)frame {
    if ((self = [super initWithFrame:frame])) {
        // Initialization code
    }
    return self;
}

/**
 We force a bottom margin of 5pixels all the time to give enough
 buffer at the bottom of the page and handle the odd situation
 where a larger margin would be randomly inserted when adding new lines
 */
- (void)setContentInset:(UIEdgeInsets)s {
	s.bottom = 5;
	s.top = 0;
	
	[super setContentInset:s];
}

- (void)dealloc {
    [super dealloc];
}


@end
