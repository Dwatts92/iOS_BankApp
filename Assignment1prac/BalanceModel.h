//
//  BalanceModel.h
//  Assignment 3 (Assignment1.prac)
//
//  Created by Dylan Watts on 9/10/14.
//  Copyright (c) 2014 Dylan Watts. All rights reserved.
//
//  Header for my balance model methods and properties

#import <Foundation/Foundation.h>

//Important: BalanceModel is just for calculations now, and helping identify errors. I don't need to store anything from this so I made
//it seperate from BankAccount object. BankAccount is the object I am using to hold time, transaction type, and balance over time.

@interface BalanceModel : NSObject

@property double bal;       //balance value
@property BOOL valid;       //bool value, checks if withdrawal is possible or not.


-(instancetype)initWithBal:(double)bal initWithValid:(BOOL)valid;     //methods explained in .m file

-(NSString*)incrementBal:(double)value;

-(NSString*)decrementBal:(double)value;

@end
