//
//  EXViewController.m
//  Example
//
//  Created by Vincil Bishop on 3/14/14.
//  Copyright (c) 2014 Premier Mobile Systems. All rights reserved.
//

#import "EXViewController.h"

@interface EXViewController ()

@property (strong, nonatomic) IBOutlet UILabel *urlLabel;

@end

@implementation EXViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    self.urlLabel.text = [[MYEnvironmentConfig sharedConfig].httpURL description];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
