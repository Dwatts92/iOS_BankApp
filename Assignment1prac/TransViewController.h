//
//  TransViewController.h
//  Assignment1prac
//
//  Created by Dylan Watts on 9/10/14.
//  Copyright (c) 2014 Dylan Watts. All rights reserved.
//
// Header for the transactions controller.

#import <UIKit/UIKit.h>

//IMPORTANT: This is my old view with the transaction string, this is not the new table view. Program kept
//braking when trying to remove it.

@interface TransViewController : UIViewController

@property (weak, nonatomic) IBOutlet UITextView *transList; //our list of transactions

@property NSString *message;    //the actual data/text that gets passed between controllers

@end
