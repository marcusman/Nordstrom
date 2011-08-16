//
//  EventsController.m
//  Nordstrom
//
//  Created by Luke Adamson on 4/5/11.
//  Copyright 2011 Nordstrom. All rights reserved.
//

/*

#import "NOREventsController.h"
#import "ASIHTTPRequest.h"
#import "CJSONDeserializer.h"





@interface NOREventsController () <ASIHTTPRequestDelegate>

@property (nonatomic, retain) NSArray *events;

- (void)loadEvents;
- (void)didLoadEvents;



@end

@implementation NOREventsController


// Public accessors
@synthesize tableView = tableView_;
@synthesize events = events_;

#pragma mark - Initialization and deallocation

- (void)dealloc;
{
    [tableView_ release];
    [events_ release];
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
    tableView.dataSource = self;
    tableView.delegate = self;
    
    
    // Maintain a direct reference to the table view and add it to the container
    self.tableView = tableView;
    [containerView addSubview:tableView];
    
    self.view = containerView;
}


- (void)viewWillAppear:(BOOL)animated;
{
    [super viewWillAppear:animated];
    [self loadEvents];
    
}

#pragma mark - UITableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section;
{
    return self.events.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath;
{
    static NSString *EventCellIdentifier = @"Event Cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:EventCellIdentifier];
    
    if (!cell) {
        cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:EventCellIdentifier] autorelease];
        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    }
    
    cell.textLabel.text = [self.events objectAtIndex:indexPath.row];
    return cell;
}

- (void) simulateLoadingEvents;
{
    self.events = [NSArray arrayWithObjects:@"testin", @"testing2", @"testing3", nil];  //placeholder
    [self performSelector:@selector(didLoadEvents) withObject:nil afterDelay:3.0];
 //   [self didLoadEvents];
}

- (void)loadEvents;
{
    //NSArray *events = [NSArray array];
    // standin for actual call to webservice
    //[self performSelector:@selector(simulateLoadingEvents) withObject:nil afterDelay:0]; //placeholder for testing
    //[self simulateLoadingEvents];
    
    NSURL *url = [NSURL URLWithString:@"http://capi.dev.nordstrom.com/v1/StoreService/events/storenumber/1?format=json&apiKey=test"];
    ASIHTTPRequest *request = [ASIHTTPRequest requestWithURL:url];
    
    request.delegate = self;
    [request startAsynchronous];
    

}

- (void)didLoadEvents;
{
    NSLog(@"%s", __PRETTY_FUNCTION__);
    //self.events = [NSArray arrayWithObjects:@"testing1", @"testing2", @"testing3", nil];  //placeholder 

    [self.tableView reloadData];
    
}

- (void)requestFinished:(ASIHTTPRequest *)request;
{
    NSLog(@"%s %@", __PRETTY_FUNCTION__, request.error);
    // get the data via its response string or data
    
    
    NSError *error = nil;
    
    NSDictionary *responseDictionary = [[CJSONDeserializer deserializer] deserialize:request.responseData error:&error];
    
    NSLog(@"%s %@",__PRETTY_FUNCTION__, responseDictionary);
    //[self didLoadEvents:responseDictionary];
    
    self.events = [responseDictionary valueForKeyPath:@"EventCollection.EventName"];
    
    
//    NSMutableArray *events =[NSMutableArray array];
//    NSArray *eventDictionaries = [responseDictionary objectForKey:@"EventCollection"];
//
//    
//
//    // ...and I want to add that description to my events array
//   
//    for (NSDictionary *eventDictionary in eventDictionaries) { // For each object in the array
//        // [eventDictionary objectForKey:@"Description"];    // I want to pull out the description
//        [events addObject:[eventDictionary objectForKey:@"EventName"]];
//    }
//    
//    
//   //  [events addObjectsFromArray:[responseDictionary objectForKey:@"EventCollection"]];
//    
//    self.events = events;
    
    [self didLoadEvents];
    
    //[self didLoadEvents];
    
}

- (void)requestFailed:(ASIHTTPRequest *)request;
{
    NSLog(@"%s %@", __PRETTY_FUNCTION__, request.error);
}


@end
*/
