//
//  DCTGoogleMapsGeocodingConnectionController.h
//  DCTGoogleMaps
//
//  Created by Daniel Tull on 21.02.2011.
//  Copyright 2011 Daniel Tull. All rights reserved.
//

#import "DCTGoogleMapsConnectionController.h"
#import <CoreLocation/CoreLocation.h>
#import <CoreData/CoreData.h>

@interface DCTGoogleMapsGeocodingConnectionController : DCTGoogleMapsConnectionController {}

@property (nonatomic, retain) NSString *address, *bounds, *region, *language;
@property (nonatomic, retain) CLLocation *location;

@end
