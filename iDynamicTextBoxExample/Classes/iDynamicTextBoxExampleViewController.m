//
//  iDynamicTextBoxExampleViewController.m
//  iDynamicTextBoxExample
//
//  Created by tim on 20/01/11.
//  Copyright 2011 Ink Scribbles. All rights reserved.
//

#import "iDynamicTextBoxExampleViewController.h"

@implementation iDynamicTextBoxExampleViewController



/*
// The designated initializer. Override to perform setup that is required before the view is loaded.
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}
*/

/*
// Implement loadView to create a view hierarchy programmatically, without using a nib.
- (void)loadView {
}
*/


// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad {
    [super viewDidLoad];
	
	iDynamicTextBox *tb = [[iDynamicTextBox alloc] initWithFrame:CGRectMake(40, 100, 240, 34)];
	
	tb.delegate = self;
	tb.maximumLines = 5;
	
	[tb setBackgroundImg:@"background.png"];
	
	[self.view addSubview:tb];
	
}


/*
// Override to allow orientations other than the default portrait orientation.
- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}
*/

- (void)didReceiveMemoryWarning {
	// Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
	
	// Release any cached data, images, etc that aren't in use.
}

- (void)viewDidUnload {
	// Release any retained subviews of the main view.
	// e.g. self.myOutlet = nil;
}


- (void)dealloc {
    [super dealloc];
}

@end
