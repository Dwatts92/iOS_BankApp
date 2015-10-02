//
//  TransactionsViewController.m
//  Assignment 3 (Assignment1.prac)
//
//  Created by Dylan on 9/24/14.
//  Copyright (c) 2014 Dylan. All rights reserved.
//
//  New transactions view, shows all transactions in a table view. Show everything in cells that expand multiple lines if needed.

#import "TransactionsViewController.h"
#import "BankAccount.h"

@interface TransactionsViewController ()

@end

@implementation TransactionsViewController

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}


- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [self loadItems];       //puts all data into transactions mutable array
}




- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the section.
    return [self.transactions count];                   //makes cell for each transaction
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"transactionCell" forIndexPath:indexPath];
    
    NSString *amountType = ((BankAccount*)[self.transactions objectAtIndex:indexPath.row]).transType; //gets transaction type from each object
    
    if ([amountType isEqualToString:@"Withdraw"]) {
        cell.imageView.image = [UIImage imageNamed:(@"withdraw.png")];      //depending on their type, displays correct image in cell
    }
    else if([amountType isEqualToString:@"Deposit"])
    {
        cell.imageView.image = [UIImage imageNamed:(@"deposit.png")];
    }
    else
    {
        cell.imageView.image= [UIImage imageNamed:(@"Incorrect.png")];
    }
    
    NSDate *object = self.transactions[indexPath.row];      //sets up row for objects
    
    [[cell textLabel] setNumberOfLines:0];                  //these lines make it so the cell text is smaller, and it expands to show all info. no
    cell.textLabel.font=[UIFont systemFontOfSize:14.0];     //other views needed.
    cell.textLabel.text = [object description];             //gets all the data in a string from transaction/BankAccount instance through description method
    return cell;
}


- (NSString *)documentsDirectory
{
    return [@"~/Documents" stringByExpandingTildeInPath];
}
- (NSString *)dataFilePath
{
    
    //comment back in to show directory NSLog(@"%@",[self documentsDirectory]);
    return [[self documentsDirectory] stringByAppendingPathComponent:@"ItemList.plist"];
    
}


- (void)loadItems
{
    // get our data file path
    NSString *path = [self dataFilePath];
    
    //do we have anything in our documents directory?  If we have anything then load it up
    if ([[NSFileManager defaultManager] fileExistsAtPath:path]) {
        NSData *data = [[NSData alloc] initWithContentsOfFile:path];
        NSKeyedUnarchiver *unarchiver = [[NSKeyedUnarchiver alloc] initForReadingWithData:data];
        self.transactions = [unarchiver decodeObjectForKey:@"Items"];           //this is where the data gets loaded in.
        [unarchiver finishDecoding];
    }
}


@end
