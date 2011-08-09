//
//  EventsController.m
//  Nordstrom
//
//  Created by Mark Allen on 4/5/11.
//  Copyright 2011 Nordstrom. All rights reserved.
//

#import "EventsController.h"
#import "EventDetailController.h"

static CGFloat EventsControllerTableRowHeight = 60;

@implementation EventsController

// Public accessors
@synthesize tableView = tableView_;

#pragma mark - Initialization and deallocation

- (void)dealloc;
{
    [tableView_ release];
    [super dealloc];
}

#pragma mark - View lifecycle

// Creates a container view, with an embedded table view. The container view is used so that we can insert a status bar during long-running operations, such as network fetches.
- (void)loadView;
{
    UIView *containerView = [[[UIView alloc] init] autorelease];
    containerView.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
    
    UITableView *tableView = [[[UITableView alloc] initWithFrame:CGRectZero style:UITableViewStylePlain] autorelease];
    tableView.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
    tableView.rowHeight = EventsControllerTableRowHeight;
    tableView.dataSource = self;
    tableView.delegate = self;
    
    // To Do: Replace the magic numbers
    UIImageView *tableHeaderView = [[[UIView alloc] initWithFrame:CGRectMake(0, 0, 320, 60)] autorelease];

    // To Do: Replace white background and placeholder header view with real header view
    tableHeaderView.backgroundColor = [UIColor whiteColor];
    
    tableView.tableHeaderView = tableHeaderView;
    
    // Maintain a direct reference to the table view and add it to the container
    self.tableView = tableView;
    [containerView addSubview:tableView];
    
    self.view = containerView;
}

- (void)viewWillAppear:(BOOL)animated;
{
    [super viewWillAppear:animated];

    // The events list does not show a standard navigation bar. Instead, that area is reserved for the next big sale countdown.
    [self.navigationController setNavigationBarHidden:YES animated:animated];
}

#pragma mark - UITableViewDataSource

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView;
{
    // To Do: Replace dummy section count constant (for 12 months) with a dynamic value
    return 12;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section;
{
    // To Do: Replace dummy row count constant with a dynamic value
    return 2;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath;
{
    static NSString *EventCellIdentifier = @"Event Cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:EventCellIdentifier];
    
    if (!cell) {
        cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:EventCellIdentifier] autorelease];
        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
        
        // To Do: Set correct font and font size
        cell.textLabel.font = [UIFont systemFontOfSize:16];
    }
    
    // To Do: Configure cell to reflect the associated event
    cell.textLabel.text = @"25-28     Half Yearly Sale for Women & Kids";
    cell.detailTextLabel.text = @"                2x Rewards Points";
    
    return cell;
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section;
{
    NSArray *nextEventMonths = [NSArray arrayWithObjects:@"April", @"May", @"June", @"July", @"August", @"September", @"October", @"November", @"December", @"January 2012", @"February 2012", @"March 2012", nil];
    
    return [nextEventMonths objectAtIndex:section];
}

#pragma mark - UITableViewDelegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath;
{
    // To Do: Lookup Event for the selected row
   
    EventDetailController *eventDetailController = [[[EventDetailController alloc] init] autorelease];

    // To Do: Propagate selected Event to EventDetailController
    // eventDetailController.event = selectedEvent;
    
    [self.navigationController pushViewController:eventDetailController animated:YES];
}

@end
