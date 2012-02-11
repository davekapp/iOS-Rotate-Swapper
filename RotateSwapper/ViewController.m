//
//  ViewController.m
//  RotateSwapper
//
//  Created by David Kapp on 2/11/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
- (void)rotateToLandscapeWithDegreeRotation:(int)degreeRotation;
@end

@implementation ViewController
@synthesize portraitView;
@synthesize landscapeView;
@synthesize xibView;

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)viewDidUnload
{
  [self setPortraitView:nil];
  [self setLandscapeView:nil];
  [self setXibView:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
}

- (void)viewWillDisappear:(BOOL)animated
{
	[super viewWillDisappear:animated];
}

- (void)viewDidDisappear:(BOOL)animated
{
	[super viewDidDisappear:animated];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
  // allow everything except upside-down
  return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
}

- (void)willRotateToInterfaceOrientation:(UIInterfaceOrientation)toInterfaceOrientation duration:(NSTimeInterval)duration {
  [super willRotateToInterfaceOrientation:toInterfaceOrientation duration:duration];

// if you want to use the xib view rather than the second one from the storyboard, use loadNibNamed:owner:options: 
//  [[NSBundle mainBundle] loadNibNamed:@"LandscapeView" owner:self options:nil];
//  self.view = self.xibView;
//  self.view.transform = CGAffineTransformMakeRotation(kDeg2Rad * -90);
//  self.view.bounds = CGRectMake(0.0, 0.0, 480.0, 300.0);

  if (toInterfaceOrientation == UIInterfaceOrientationLandscapeRight) {
    [self rotateToLandscapeWithDegreeRotation:90];
  } else if (toInterfaceOrientation == UIInterfaceOrientationLandscapeLeft) {
    [self rotateToLandscapeWithDegreeRotation:-90];
  } else {
    self.view = self.portraitView;
    self.view.transform = CGAffineTransformMakeRotation(0);
    self.view.bounds = CGRectMake(0.0, 0.0, 320.0, 460.0);
  }
}

- (void)rotateToLandscapeWithDegreeRotation:(int)degreeRotation {
  self.view = self.landscapeView;
  self.view.transform = CGAffineTransformMakeRotation(kDeg2Rad * degreeRotation);
  self.view.bounds = CGRectMake(0.0, 0.0, 480.0, 300.0);
}

@end




























