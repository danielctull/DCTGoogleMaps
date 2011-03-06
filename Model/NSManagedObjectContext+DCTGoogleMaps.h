//
//  NSManagedObjectContext+DCTGoogleMaps.h
//  DCTGoogleMaps
//
//  Created by Daniel Tull on 06.03.2011.
//  Copyright 2011 Daniel Tull. All rights reserved.
//

#import <CoreData/CoreData.h>
#import <CoreLocation/CoreLocation.h>
#import "DCTGoogleMapsSearch.h"
#import "DCTGoogleMapsPlace.h"

@interface NSManagedObjectContext (DCTGoogleMaps)

- (DCTGoogleMapsSearch *)dct_googleMapsSearchWithString:(NSString *)string;
- (DCTGoogleMapsPlace *)dct_googleMapsPlaceWithLocation:(CLLocation *)location;

@end
