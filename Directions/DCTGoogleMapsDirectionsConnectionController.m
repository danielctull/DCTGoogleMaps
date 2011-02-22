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

@implementation DCTGoogleMapsDirectionsConnectionController
@synthesize startString, endString, startLocation, endLocation;

- (void)dealloc {
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

- (void)receivedObject:(NSObject *)object {
	
	if (![object isKindOfClass:[NSData class]]) return [super receivedObject:object];
	
	NSData *data = (NSData *)object;
	
	NSString *jsonString = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
	
	SBJsonParser *jsonParser = [SBJsonParser new];
	NSError *err = nil;
	NSDictionary *dictionary = [jsonParser objectWithString:jsonString error:&err];
	
	if ([[dictionary objectForKey:DCTGoogleMapsAPIStatus] isEqualToString:DCTGoogleMapsAPIStatusZeroResults]) 
		return [super receivedObject:object];
	
	NSManagedObjectContext *context = self.managedObjectContext;
	
	DCTGoogleMapsDirection *direction = [DCTGoogleMapsDirection dct_objectFromDictionary:dictionary 
														  insertIntoManagedObjectContext:context];
	
	[super receivedObject:direction];
}

+ (CLLocation *)locationFromDictionary:(NSDictionary *)dictionary {
	NSNumber *latitudeNumber = [dictionary objectForKey:DCTGoogleMapsAPILatitude];
	NSNumber *longitudeNumber = [dictionary objectForKey:DCTGoogleMapsAPILongitude];
	return [[[CLLocation alloc] initWithLatitude:[latitudeNumber doubleValue] longitude:[longitudeNumber doubleValue]] autorelease];
}

@end
