//
//  BankAccount.h
//  Assignment 3 (Assignment1.prac)
//
//  Created by Dylan on 9/24/14.
//  Copyright (c) 2014 Dylan. All rights reserved.
//
//IMPORTANT: This is the coding object that holds all data, time & date, transactions, balance, and gets stays persistent across runs.
//This is the BankAccount object/model

#import <Foundation/Foundation.h>

@interface BankAccount : NSObject <NSCoding>

@property NSString *theDate;        //time/date stored
@property double transAmount;       //transaction amount stored
@property NSString *transType;      //transaction type stored
@property double bankBalance;       //balance stored


@end
