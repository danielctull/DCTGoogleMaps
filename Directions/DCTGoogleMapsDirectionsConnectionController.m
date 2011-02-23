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

@interface DCTGoogleMapsDirectionsConnectionController ()
@property (nonatomic, readonly) NSString *origin;
@property (nonatomic, readonly) NSString *destination;
@end


@implementation DCTGoogleMapsDirectionsConnectionController
@synthesize startString, endString, startLocation, endLocation, startPlace, endPlace;

- (void)dealloc {
	[startPlace release], startPlace = nil;
	[endPlace release], endPlace = nil;
	[startLocation release], startLocation = nil;
	[endLocation release], endLocation = nil;
	[startString release], startString = nil;
	[endString release], endString = nil;
	[super dealloc];
}

- (NSString *)baseURLString {
	return [NSString stringWithFormat:@"%@/directions/json", [super baseURLString]];
}

+ (NSArray *)queryProperties {
	return [NSArray arrayWithObjects:@"origin", @"destination", nil];
}

- (NSString *)origin {
	
	if (self.startLocation)
		return [NSString stringWithFormat:@"%f,%f", self.startLocation.coordinate.latitude, self.startLocation.coordinate.longitude];
	
	return self.startString;
}

- (NSString *)destination {
	
	if (self.endLocation)
		return [NSString stringWithFormat:@"%f,%f", self.endLocation.coordinate.latitude, self.endLocation.coordinate.longitude];
	
	return self.endString;
}

- (CLLocation *)startLocation {
	
	if (self.startPlace) self.startLocation = self.startPlace.location;
	
	return startLocation;
}

- (CLLocation *)endLocation {
	
	if (self.endPlace) self.endLocation = self.endPlace.location;
	
	return endLocation;
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
	
	direction.startPlace = self.startPlace;
	direction.endPlace = self.endPlace;
	
	[super receivedObject:direction];
}

+ (CLLocation *)locationFromDictionary:(NSDictionary *)dictionary {
	NSNumber *latitudeNumber = [dictionary objectForKey:DCTGoogleMapsLatitude];
	NSNumber *longitudeNumber = [dictionary objectForKey:DCTGoogleMapsLongitude];
	return [[[CLLocation alloc] initWithLatitude:[latitudeNumber doubleValue] longitude:[longitudeNumber doubleValue]] autorelease];
}

@end
