//
//  TransactionsViewController.h
//  Assignment 3 (Assignment1.prac)
//
//  Created by Dylan on 9/24/14.
//  Copyright (c) 2014 Dylan. All rights reserved.
//
//  Header for my transactions table.

#import <UIKit/UIKit.h>

@interface TransactionsViewController : UITableViewController

@property  UITableView *transactionList;

@property (nonatomic, strong) NSMutableArray * transactions;    //the array that gets all the data from our directory file.

@end
