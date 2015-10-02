//
//  BalanceModel.m
//  Assignment 3 (Assignment1.prac)
//
//  Created by Dylan Watts on 9/10/14.
//  Copyright (c) 2014 Dylan Watts. All rights reserved.
//
//  This is the model file for the Balance number.

#import "BalanceModel.h"

//Important: BalanceModel is just for calculations now, and helping identify errors. I don't need to store anything from this so I made
//it seperate from BankAccount object. BankAccount is the object I am using to hold time, transaction type, and balance over time.

@implementation BalanceModel

-(instancetype)initWithBal:(double)bal initWithValid:(BOOL)valid  //initializes BalanceModel object for use in other classes
{
    self = [super init];
    if(self)
    {
        self.bal = bal;
        self.valid = valid;
    }
    return self;
}

-(NSString*)incrementBal:(double)value  //a method used in adding a deposit value to the balance.
{                                       //checks for negative numbers and outputs NSLog error and converts to proper float, then string.
    if (value < 0)
    {
        self.valid = false;
        NSLog(@"You're trying to deposit negative dollars. Transaction didn't go through.");
        return [NSString stringWithFormat:@"%.02f",self.bal];
    }
    else
    {
       self.valid = true;
    self.bal = self.bal + value;
    return [NSString stringWithFormat:@"%.02f",self.bal];
    }
}

-(NSString*)decrementBal:(double)value   //a method used in subtracting a withdrawal value from the balance.
{                                        //checks for negative numbers and if the balance goes below 0 and outputs error in NSLog.
                                         //converts balance to two decimal float, then string
    if (value < 0)
    {
        self.valid = false;
        NSLog(@"You're trying to withdraw negative dollars. Bad transaction.");
        return [NSString stringWithFormat:@"%.02f",self.bal];
    }

    else if((self.bal-value) < 0)
    {
        self.valid = false;
        NSLog(@"WARNING! You are trying to withdraw more than you have! Bad transaction.");
        return [NSString stringWithFormat:@"%.02f",self.bal];
    }
    else
    {
        self.valid = true;
        self.bal = self.bal - value;
        return [NSString stringWithFormat:@"%.02f",self.bal];
        
    }
    
}


@end
