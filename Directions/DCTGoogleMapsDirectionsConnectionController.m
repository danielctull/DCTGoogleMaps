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


NSString *const DTGoogleDirectionsAPIStatusKey = @"status";
NSString *const DTGoogleDirectionsAPIStatusOK = @"OK";
NSString *const DTGoogleDirectionsAPIStatusNotFound = @"NOT_FOUND";
NSString *const DTGoogleDirectionsAPIStatusZeroResults = @"ZERO_RESULTS";
NSString *const DTGoogleDirectionsAPIStatusMaxWaypointsExceeded = @"MAX_WAYPOINTS_EXCEEDED";
NSString *const DTGoogleDirectionsAPIStatusInvalidRequest = @"INVALID_REQUEST";
NSString *const DTGoogleDirectionsAPIStatusOverQueryLimit = @"OVER_QUERY_LIMIT";
NSString *const DTGoogleDirectionsAPIStatusRequestDenied = @"REQUEST_DENIED";
NSString *const DTGoogleDirectionsAPIStatusUnknownError = @"UNKNOWN_ERROR";


NSString *const DTGoogleDirectionsAPIRoutesKey = @"routes";
NSString *const DTGoogleDirectionsAPILegsKey = @"legs";
NSString *const DTGoogleDirectionsAPIStepsKey = @"steps";
NSString *const DTGoogleDirectionsAPIPointsKey = @"points";
NSString *const DTGoogleDirectionsAPILevelsKey = @"levels";

NSString *const DTGoogleDirectionsAPISummaryKey = @"summary";

NSString *const DTGoogleDirectionsAPICopyrightsKey = @"copyrights";
NSString *const DTGoogleDirectionsAPIDistanceKey = @"distance";
NSString *const DTGoogleDirectionsAPIDurationKey = @"duration";
NSString *const DTGoogleDirectionsAPIValueKey = @"value";
NSString *const DTGoogleDirectionsAPITextKey = @"text";
NSString *const DTGoogleDirectionsAPIPolylineKey = @"polyline";
NSString *const DTGoogleDirectionsAPIOverviewPolylineKey = @"overview_polyline";
NSString *const DTGoogleDirectionsAPILatitudeKey = @"lat";
NSString *const DTGoogleDirectionsAPILongitudeKey = @"lng";
NSString *const DTGoogleDirectionsAPIStartLocationKey = @"start_location";
NSString *const DTGoogleDirectionsAPIEndLocationKey = @"end_location";
NSString *const DTGoogleDirectionsAPIStartAddressKey = @"start_address";
NSString *const DTGoogleDirectionsAPIEndAddressKey = @"end_address";

NSString *const DTGoogleDirectionsAPIInstructionsKey = @"html_instructions";

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
	
	if ([[dictionary objectForKey:DTGoogleDirectionsAPIStatusKey] isEqualToString:@"ZERO_RESULTS"]) 
		return [super receivedObject:object];
	
	NSManagedObjectContext *context = self.managedObjectContext;
	
	DCTGoogleMapsDirection *direction = [DCTGoogleMapsDirection dct_objectFromDictionary:dictionary 
														  insertIntoManagedObjectContext:context];
	
	[super receivedObject:direction];
}

+ (CLLocation *)locationFromDictionary:(NSDictionary *)dictionary {
	NSNumber *latitudeNumber = [dictionary objectForKey:DTGoogleDirectionsAPILatitudeKey];
	NSNumber *longitudeNumber = [dictionary objectForKey:DTGoogleDirectionsAPILongitudeKey];
	return [[[CLLocation alloc] initWithLatitude:[latitudeNumber doubleValue] longitude:[longitudeNumber doubleValue]] autorelease];
}

@end
