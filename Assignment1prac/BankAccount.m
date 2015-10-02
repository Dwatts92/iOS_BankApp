//
//  BankAccount.m
//  Assignment 3 (Assignment1.prac)
//
//  Created by Dylan on 9/24/14.
//  Copyright (c) 2014 Dylan. All rights reserved.
//
// NSCoding object model for the bank account.
//IMPORTANT: This is the coding object that holds all data, time & date, transactions, balance, and gets stays persistent across runs.

#import "BankAccount.h"

@implementation BankAccount



-(void)encodeWithCoder:(NSCoder *)aCoder    //encodes attributes
{
    
    [aCoder encodeObject:self.theDate forKey:@"theDate"];
    [aCoder encodeDouble:self.transAmount forKey:@"transAmount"];
    [aCoder encodeObject:self.transType forKey:@"transType"];
    [aCoder encodeDouble:self.bankBalance forKey:@"bankBalance"];
}

-(instancetype)initWithCoder:(NSCoder *)aDecoder    //initalization
{
    self = [super init];
    
    self.theDate = [aDecoder decodeObjectForKey:@"theDate"];
    self.transAmount = [aDecoder decodeDoubleForKey:@"transAmount"];
    self.transType = [aDecoder decodeObjectForKey:@"transType"];
    self.bankBalance = [aDecoder decodeDoubleForKey:@"bankBalance"];
    
    return self;
}

-(NSString *)description    //gives a string with its data, used for the transactions list.
{
    return [NSString stringWithFormat:@"%@: $%.02f %@",self.transType, self.transAmount, self.theDate];
}



@end
