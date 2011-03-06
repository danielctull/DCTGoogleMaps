//
//  NSManagedObjectContext+DCTGoogleMaps.m
//  DCTGoogleMaps
//
//  Created by Daniel Tull on 06.03.2011.
//  Copyright 2011 Daniel Tull. All rights reserved.
//

#import "NSManagedObjectContext+DCTGoogleMaps.h"
#import "NSManagedObjectContext+DCTDataFetching.h"
#import "NSPredicate+DCTExtras.h"

@implementation NSManagedObjectContext (DCTGoogleMaps)

- (DCTGoogleMapsSearch *)dct_googleMapsSearchWithString:(NSString *)string {
	NSPredicate *predicate = [NSPredicate dct_predicateWhereProperty:@"searchString" equals:string];
	DCTGoogleMapsSearch *search = [self dct_fetchAnyObjectForEntityName:@"DCTGoogleMapsSearch" predicate:predicate];
	
	if (!(search)) {
		search = [self dct_insertNewObjectForEntityName:@"DCTGoogleMapsSearch"];
		search.searchString = string;
	}
	
	return search;
}

- (DCTGoogleMapsPlace *)dct_googleMapsPlaceWithLocation:(CLLocation *)location {
	NSPredicate *predicate = [NSPredicate dct_predicateWhereProperty:@"location" equals:location];
	DCTGoogleMapsPlace *place = [self dct_fetchAnyObjectForEntityName:@"DCTGoogleMapsPlace" predicate:predicate];
	
	if (!(place)) {
		place = [self dct_insertNewObjectForEntityName:@"DCTGoogleMapsPlace"];
		place.location = location;
	}
	
	return place;
}

@end
