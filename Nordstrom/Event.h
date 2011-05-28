//
//  Event.h
//  Nordstrom
//
//  Created by Luke Adamson on 4/27/11.
//  Copyright 2011 Nordstrom. All rights reserved.
//  Changing test dfasdfsadf
//  test #2
//  test #3
//  Branch testing to new branch
//  add more stuff to branch
//  even more #4 try to get to gitbuh


#import <Foundation/Foundation.h>

// Event models Nordstrom store events and sales. Some events span all stores, such as the "Half Yearly Sale for Women & Kids". Other events are store-specific, such as designer trunk shows. Users are shown upcoming events to increase event visibility and participation (more shopping).
@interface Event : NSObject

@property (nonatomic, retain) NSString *title;

// Dates should be stored as UTC and then presented in the user's local timezone
@property (nonatomic, retain) NSDate *startDate;
@property (nonatomic, retain) NSDate *endDate;

// Multiplier should be nil, or whole integers, such as 2 for "Double Points", 3 for "Triple Points", etc.
@property (nonatomic, retain) NSNumber *rewardPointsMultiplier;

// To Do: Finish modeling Event
// Additional properties we will need:
//
//   - locationName (or -storeName, or -store (for a first-class object))
//   - locationAddress (compound object or lat/lon: used for opening Maps app to get directions)
//   - eventDescription
//   - image
//   - URL (if we're going to share events on Facebook; also useful for sharing on Twitter and email)
//   - RSVPEnabled (if we're going to support RSVP for some Events)

@end
