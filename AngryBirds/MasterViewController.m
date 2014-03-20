//
//  MasterViewController.m
//  AngryBirds
//
//  Created by g102 DIT UPM on 27/02/14.
//  Copyright (c) 2014 g102 DIT UPM. All rights reserved.
//

#import "MasterViewController.h"
#import "AngryBirdsViewController.h"

@interface MasterViewController ()

@end

@implementation MasterViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    if ([segue.identifier isEqualToString:@"showOriginal"]) {
        AngryBirdsViewController *destViewController = segue.destinationViewController;
        destViewController.gravity = 9.80665;
        destViewController.background = @"angry-birds-background.png";
        destViewController.pig = @"angry-birds-pig.png";
        destViewController.bird = @"angry-birds-red.png";
    } else{
        AngryBirdsViewController *destViewController = segue.destinationViewController;
        destViewController.gravity = 3.711;
        destViewController.background = @"star-wars-background.png";
        destViewController.pig = @"star-wars-vader.png";
        destViewController.bird = @"star-wars-luke.png";
    }
}

@end
