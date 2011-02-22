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

extern NSString *const DCTGoogleMapsAPIStatus;
extern NSString *const DCTGoogleMapsAPIStatusOK;
extern NSString *const DCTGoogleMapsAPIStatusNotFound;
extern NSString *const DCTGoogleMapsAPIStatusZeroResults;
extern NSString *const DCTGoogleMapsAPIStatusMaxWaypointsExceeded;
extern NSString *const DCTGoogleMapsAPIStatusInvalidRequest;
extern NSString *const DCTGoogleMapsAPIStatusOverQueryLimit;
extern NSString *const DCTGoogleMapsAPIStatusRequestDenied;
extern NSString *const DCTGoogleMapsAPIStatusUnknownError;

extern NSString *const DCTGoogleMapsAPIRoutes;
extern NSString *const DCTGoogleMapsAPILegs;
extern NSString *const DCTGoogleMapsAPISteps;
extern NSString *const DCTGoogleMapsAPIPoints;
extern NSString *const DCTGoogleMapsAPILevels;

extern NSString *const DCTGoogleMapsAPISummary;

extern NSString *const DCTGoogleMapsAPICopyrights;
extern NSString *const DCTGoogleMapsAPIDistance;
extern NSString *const DCTGoogleMapsAPIDuration;
extern NSString *const DCTGoogleMapsAPIValue;
extern NSString *const DCTGoogleMapsAPIText;
extern NSString *const DCTGoogleMapsAPIPolyline;
extern NSString *const DCTGoogleMapsAPIOverviewPolyline;
extern NSString *const DCTGoogleMapsAPILatitude;
extern NSString *const DCTGoogleMapsAPILongitude;
extern NSString *const DCTGoogleMapsAPIStartLocation;
extern NSString *const DCTGoogleMapsAPIEndLocation;
extern NSString *const DCTGoogleMapsAPIStartAddress;
extern NSString *const DCTGoogleMapsAPIEndAddress;
extern NSString *const DCTGoogleMapsAPIInstructions;

@interface DCTGoogleMapsConnectionController : DCTRESTController {}

@property (nonatomic, retain) NSManagedObjectContext *managedObjectContext;

+ (CLLocation *)locationFromDictionary:(NSDictionary *)dictionary;

@end
