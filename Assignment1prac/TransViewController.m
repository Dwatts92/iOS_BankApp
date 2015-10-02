//
//  TransViewController.m
//  Assignment1prac
//
//  Created by Dylan Watts on 9/10/14.
//  Copyright (c) 2014 Dylan Watts. All rights reserved.
//
//  This is the transaction controller, it lists all transactions made at the exact time entered.

#import "TransViewController.h"

@interface TransViewController ()

//IMPORTANT: This is my old view with the transaction string, this is not the new table view. Program kept
//braking when trying to remove it.

@end

@implementation TransViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.transList.text = [self.message stringByAppendingString:@""];   //basically this entire file is this one line. simply gets the text/data from the other
}                                                                       //controller and appends it to textview.

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
