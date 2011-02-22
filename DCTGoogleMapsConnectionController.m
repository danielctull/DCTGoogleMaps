//
//  DCTGoogleMapsConnectionController.m
//  DCTGoogleMaps
//
//  Created by Daniel Tull on 21.02.2011.
//  Copyright 2011 Daniel Tull. All rights reserved.
//

#import "DCTGoogleMapsConnectionController.h"

NSString *const DCTGoogleMapsAPIStatus = @"status";
NSString *const DCTGoogleMapsAPIStatusOK = @"OK";
NSString *const DCTGoogleMapsAPIStatusNotFound = @"NOT_FOUND";
NSString *const DCTGoogleMapsAPIStatusZeroResults = @"ZERO_RESULTS";
NSString *const DCTGoogleMapsAPIStatusMaxWaypointsExceeded = @"MAX_WAYPOINTS_EXCEEDED";
NSString *const DCTGoogleMapsAPIStatusInvalidRequest = @"INVALID_REQUEST";
NSString *const DCTGoogleMapsAPIStatusOverQueryLimit = @"OVER_QUERY_LIMIT";
NSString *const DCTGoogleMapsAPIStatusRequestDenied = @"REQUEST_DENIED";
NSString *const DCTGoogleMapsAPIStatusUnknownError = @"UNKNOWN_ERROR";


NSString *const DCTGoogleMapsAPIRoutes = @"routes";
NSString *const DCTGoogleMapsAPILegs = @"legs";
NSString *const DCTGoogleMapsAPISteps = @"steps";
NSString *const DCTGoogleMapsAPIPoints = @"points";
NSString *const DCTGoogleMapsAPILevels = @"levels";

NSString *const DCTGoogleMapsAPISummary = @"summary";

NSString *const DCTGoogleMapsAPICopyrights = @"copyrights";
NSString *const DCTGoogleMapsAPIDistance = @"distance";
NSString *const DCTGoogleMapsAPIDuration = @"duration";
NSString *const DCTGoogleMapsAPIValue = @"value";
NSString *const DCTGoogleMapsAPIText = @"text";
NSString *const DCTGoogleMapsAPIPolyline = @"polyline";
NSString *const DCTGoogleMapsAPIOverviewPolyline = @"overview_polyline";
NSString *const DCTGoogleMapsAPILatitude = @"lat";
NSString *const DCTGoogleMapsAPILongitude = @"lng";
NSString *const DCTGoogleMapsAPIStartLocation = @"start_location";
NSString *const DCTGoogleMapsAPIEndLocation = @"end_location";
NSString *const DCTGoogleMapsAPIStartAddress = @"start_address";
NSString *const DCTGoogleMapsAPIEndAddress = @"end_address";
NSString *const DCTGoogleMapsAPIInstructions = @"html_instructions";

@implementation DCTGoogleMapsConnectionController

@synthesize managedObjectContext;

- (NSString *)baseURLString {
	return @"http://maps.google.com/maps/api";
}

+ (NSArray *)queryProperties {
	return [NSArray arrayWithObject:@"sensor"];
}

- (NSString *)sensor {
	return @"true";
}

+ (CLLocation *)locationFromDictionary:(NSDictionary *)dictionary {
	NSNumber *latitudeNumber = [dictionary objectForKey:DCTGoogleMapsAPILatitude];
	NSNumber *longitudeNumber = [dictionary objectForKey:DCTGoogleMapsAPILongitude];
	return [[[CLLocation alloc] initWithLatitude:[latitudeNumber doubleValue] longitude:[longitudeNumber doubleValue]] autorelease];
}

@end
