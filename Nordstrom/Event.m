//
//  Event.m
//  Nordstrom
//
//  Created by Luke Adamson on 4/27/11.
//  Copyright 2011 Nordstrom. All rights reserved.
//

#import "Event.h"

@implementation Event

#pragma mark - Public accessors
@synthesize title = title_;
@synthesize startDate = startDate_;
@synthesize endDate = endDate_;
@synthesize rewardPointsMultiplier = rewardPointsMultiplier_;

#pragma mark - Initialization and deallocation

- (void)dealloc;
{
    [title_ release];
    [startDate_ release];
    [endDate_ release];
    [rewardPointsMultiplier_ release];
    
    [super dealloc];
}

@end
