//
//  DCTGoogleMapsPlace+Implementation.h
//  DCTGoogleMaps
//
//  Created by Daniel Tull on 21.02.2011.
//  Copyright 2011 Daniel Tull. All rights reserved.
//

#import "DCTGoogleMapsPlace.h"
#import "NSManagedObject+DCTAutomatedSetup.h"

@interface DCTGoogleMapsPlace (Implementation) <DCTManagedObjectAutomatedSetup>
@property (nonatomic, readonly) NSString *address;

- (void)downloadGeocodeInformation;
- (void)downloadDirectionsToPlace:(DCTGoogleMapsPlace *)place;

@end
