//
//  BAViewController.m
//  BAProgressViewTest
//
//  Created by Brian Schrader on 7/29/13.
//  Copyright (c) 2013 Brian Schrader. All rights reserved.
//

#import "BAViewController.h"
#import "BAProgressView.h"
#import "time.h"

@interface BAViewController ()
{
    BAProgressView *progressView;
    BOOL repeat;
    float progress;
}

@property (nonatomic, strong) IBOutlet UIButton *button;

- (void) startProcess;
- (IBAction)updateProgress:(id)sender;

@end

@implementation BAViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    progressView = [[BAProgressView alloc] initWithFrame:CGRectMake(50, 200, 220, 50)];
    [self.view addSubview:progressView];
    repeat = YES;
    progress = 0;
    [self startProcess];
}

-(void)startProcess {
    [progressView setProgress:0.0];
}

-(IBAction)updateProgress:(id)sender{
    progress += 0.1;
    [progressView setProgress:progress];
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
