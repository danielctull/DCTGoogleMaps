//
//  DCTGoogleMapsConnectionController.h
//  DCTGoogleMaps
//
//  Created by Daniel Tull on 21.02.2011.
//  Copyright 2011 Daniel Tull. All rights reserved.
//

#import "DCTRESTController.h"
#import <CoreData/CoreData.h>
#import <CoreLocation/CoreLocation.h>

extern NSString *const DCTGoogleMapsStatus;
extern NSString *const DCTGoogleMapsStatusOK;
extern NSString *const DCTGoogleMapsStatusNotFound;
extern NSString *const DCTGoogleMapsStatusZeroResults;
extern NSString *const DCTGoogleMapsStatusMaxWaypointsExceeded;
extern NSString *const DCTGoogleMapsStatusInvalidRequest;
extern NSString *const DCTGoogleMapsStatusOverQueryLimit;
extern NSString *const DCTGoogleMapsStatusRequestDenied;
extern NSString *const DCTGoogleMapsStatusUnknownError;

extern NSString *const DCTGoogleMapsRoutes;
extern NSString *const DCTGoogleMapsLegs;
extern NSString *const DCTGoogleMapsSteps;
extern NSString *const DCTGoogleMapsPoints;
extern NSString *const DCTGoogleMapsLevels;

extern NSString *const DCTGoogleMapsSummary;

extern NSString *const DCTGoogleMapsCopyrights;
extern NSString *const DCTGoogleMapsDistance;
extern NSString *const DCTGoogleMapsDuration;
extern NSString *const DCTGoogleMapsValue;
extern NSString *const DCTGoogleMapsText;
extern NSString *const DCTGoogleMapsPolyline;
extern NSString *const DCTGoogleMapsOverviewPolyline;
extern NSString *const DCTGoogleMapsLatitude;
extern NSString *const DCTGoogleMapsLongitude;
extern NSString *const DCTGoogleMapsStartLocation;
extern NSString *const DCTGoogleMapsEndLocation;
extern NSString *const DCTGoogleMapsStartAddress;
extern NSString *const DCTGoogleMapsEndAddress;
extern NSString *const DCTGoogleMapsInstructions;

extern NSString *const DCTGoogleMapsAddressComponents;

@interface DCTGoogleMapsConnectionController : DCTRESTController {}

@property (nonatomic, retain) NSManagedObjectContext *managedObjectContext;

+ (CLLocation *)locationFromDictionary:(NSDictionary *)dictionary;

@end
