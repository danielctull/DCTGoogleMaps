//
//  DCTGoogleMapsConnectionController.m
//  DCTGoogleMaps
//
//  Created by Daniel Tull on 21.02.2011.
//  Copyright 2011 Daniel Tull. All rights reserved.
//

#import "DCTGoogleMapsConnectionController.h"

NSString *const DCTGoogleMapsStatus = @"status";
NSString *const DCTGoogleMapsStatusOK = @"OK";
NSString *const DCTGoogleMapsStatusNotFound = @"NOT_FOUND";
NSString *const DCTGoogleMapsStatusZeroResults = @"ZERO_RESULTS";
NSString *const DCTGoogleMapsStatusMaxWaypointsExceeded = @"MAX_WAYPOINTS_EXCEEDED";
NSString *const DCTGoogleMapsStatusInvalidRequest = @"INVALID_REQUEST";
NSString *const DCTGoogleMapsStatusOverQueryLimit = @"OVER_QUERY_LIMIT";
NSString *const DCTGoogleMapsStatusRequestDenied = @"REQUEST_DENIED";
NSString *const DCTGoogleMapsStatusUnknownError = @"UNKNOWN_ERROR";


NSString *const DCTGoogleMapsRoutes = @"routes";
NSString *const DCTGoogleMapsLegs = @"legs";
NSString *const DCTGoogleMapsSteps = @"steps";
NSString *const DCTGoogleMapsPoints = @"points";
NSString *const DCTGoogleMapsLevels = @"levels";

NSString *const DCTGoogleMapsSummary = @"summary";

NSString *const DCTGoogleMapsCopyrights = @"copyrights";
NSString *const DCTGoogleMapsDistance = @"distance";
NSString *const DCTGoogleMapsDuration = @"duration";
NSString *const DCTGoogleMapsValue = @"value";
NSString *const DCTGoogleMapsText = @"text";
NSString *const DCTGoogleMapsPolyline = @"polyline";
NSString *const DCTGoogleMapsOverviewPolyline = @"overview_polyline";
NSString *const DCTGoogleMapsLatitude = @"lat";
NSString *const DCTGoogleMapsLongitude = @"lng";
NSString *const DCTGoogleMapsStartLocation = @"start_location";
NSString *const DCTGoogleMapsEndLocation = @"end_location";
NSString *const DCTGoogleMapsStartAddress = @"start_address";
NSString *const DCTGoogleMapsEndAddress = @"end_address";
NSString *const DCTGoogleMapsInstructions = @"html_instructions";

NSString *const DCTGoogleMapsAddressComponents = @"address_components";

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
	NSNumber *latitudeNumber = [dictionary objectForKey:DCTGoogleMapsLatitude];
	NSNumber *longitudeNumber = [dictionary objectForKey:DCTGoogleMapsLongitude];
	return [[[CLLocation alloc] initWithLatitude:[latitudeNumber doubleValue] longitude:[longitudeNumber doubleValue]] autorelease];
}

@end
