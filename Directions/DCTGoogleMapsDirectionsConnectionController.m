//
//  DCTGoogleMapsDirectionsConnectionController.m
//  DCTGoogleMaps
//
//  Created by Daniel Tull on 29.07.2010.
//  Copyright 2010 Daniel Tull. All rights reserved.
//

#import "DCTGoogleMapsDirectionsConnectionController.h"
#import "NSString+DCTURLEncoding.h"
#import "JSON.h"
#import "MKPolyline+DCTGoogleEncoding.h"
#import "DCTGoogleMapsDirection+Implementation.h"
#import "NSError+DCTExtensions.h"
#import "NSManagedObjectContext+DCTDataFetching.h"

@interface DCTGoogleMapsDirectionsConnectionController ()
@property (nonatomic, readonly) NSString *origin;
@property (nonatomic, readonly) NSString *destination;
@end


@implementation DCTGoogleMapsDirectionsConnectionController
@synthesize startSearch, endSearch, startPlace, endPlace;

- (void)dealloc {
	[startPlace release], startPlace = nil;
	[endPlace release], endPlace = nil;
	[startSearch release], startSearch = nil;
	[endSearch release], endSearch = nil;
	[super dealloc];
}

- (NSString *)baseURLString {
	return [NSString stringWithFormat:@"%@/directions/json", [super baseURLString]];
}

+ (NSArray *)queryProperties {
	return [NSArray arrayWithObjects:@"origin", @"destination", nil];
}

- (NSString *)origin {
	
	if ((self.startPlace)) {
		CLLocationCoordinate2D coordinate = self.startPlace.location.coordinate;
		return [NSString stringWithFormat:@"%f,%f", coordinate.latitude, coordinate.longitude];
	}
	
	if (!(self.startSearch.place)) {
		DCTGoogleMapsPlace *place = [self.managedObjectContext dct_insertNewObjectForEntityName:@"DCTGoogleMapsPlace"];
		self.startSearch.place = place;
	}
	
	return self.startSearch.searchString;
}

- (NSString *)destination {
	
	if ((self.endPlace)) {
		CLLocationCoordinate2D coordinate = self.endPlace.location.coordinate;
		return [NSString stringWithFormat:@"%f,%f", coordinate.latitude, coordinate.longitude];
	}
	
	if (!(self.endSearch.place)) {
		DCTGoogleMapsPlace *place = [self.managedObjectContext dct_insertNewObjectForEntityName:@"DCTGoogleMapsPlace"];
		self.endSearch.place = place;
	}
	
	return self.endSearch.searchString;
}

- (void)receivedObject:(NSObject *)object {
	
	if (![object isKindOfClass:[NSData class]]) return [super receivedObject:object];
	
	NSData *data = (NSData *)object;
	
	NSString *jsonString = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
	
	NSLog(@"%@:%@ %@", self, NSStringFromSelector(_cmd), jsonString);
	
	SBJsonParser *jsonParser = [[SBJsonParser alloc] init];
	NSError *err = nil;
	NSDictionary *dictionary = [jsonParser objectWithString:jsonString error:&err];
	
	[jsonString release];
	[jsonParser release];
	
	NSLog(@"%@:%@ %@", self, NSStringFromSelector(_cmd), dictionary);
	
	if ([[dictionary objectForKey:DCTGoogleMapsStatus] isEqualToString:DCTGoogleMapsStatusZeroResults]) {
		
		NSError *error = [NSError dct_errorWithDomain:@"DCTGoogleMaps"
												 code:0
								 localizedDescription:[NSString stringWithFormat:@"No routes found for directions from %@ to %@", [self origin], [self destination]]];
		
		[self receivedError:error];
		return;
		
	} else if ([[dictionary objectForKey:DCTGoogleMapsStatus] isEqualToString:DCTGoogleMapsStatusNotFound]) {
		
		NSError *error = [NSError dct_errorWithDomain:@"DCTGoogleMaps"
												 code:0
								 localizedDescription:[NSString stringWithFormat:@"No results found for either %@ or %@", [self origin], [self destination]]];
		
		[self receivedError:error];
		return;
	}
		
	
	NSManagedObjectContext *context = self.managedObjectContext;
	
	DCTGoogleMapsDirection *direction = [DCTGoogleMapsDirection dct_objectFromDictionary:dictionary 
														  insertIntoManagedObjectContext:context];
	
	
	if ((self.startPlace))
		direction.startPlace = self.startPlace;
	else
		direction.startPlace = self.startSearch.place;
	
	
	if ((self.endPlace))
		direction.endPlace = self.endPlace;
	else
		direction.endPlace = self.endSearch.place;
	
	[super receivedObject:direction];
}

+ (CLLocation *)locationFromDictionary:(NSDictionary *)dictionary {
	NSNumber *latitudeNumber = [dictionary objectForKey:DCTGoogleMapsLatitude];
	NSNumber *longitudeNumber = [dictionary objectForKey:DCTGoogleMapsLongitude];
	return [[[CLLocation alloc] initWithLatitude:[latitudeNumber doubleValue] longitude:[longitudeNumber doubleValue]] autorelease];
}

@end
