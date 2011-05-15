//
//  EventsController.h
//  Nordstrom
//
//  Created by Luke Adamson on 4/5/11.
//  Copyright 2011 Nordstrom. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface EventsController : UIViewController <UITableViewDataSource, UITableViewDelegate>

@property (nonatomic, retain) UITableView *tableView;

@end
