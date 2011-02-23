//
//  DCTGoogleMapsDirectionsConnectionController.h
//  DCTGoogleMaps
//
//  Created by Daniel Tull on 29.07.2010.
//  Copyright 2010 Daniel Tull. All rights reserved.
//

#import "DCTGoogleMapsConnectionController.h"
#import <CoreLocation/CoreLocation.h>
#import "DCTGoogleMapsPlace.h"

extern NSString *const DTGoogleDirectionsAPIStatusKey;
extern NSString *const DTGoogleDirectionsAPIStatusOK;
extern NSString *const DTGoogleDirectionsAPIStatusNotFound;
extern NSString *const DTGoogleDirectionsAPIStatusZeroResults;
extern NSString *const DTGoogleDirectionsAPIStatusMaxWaypointsExceeded;
extern NSString *const DTGoogleDirectionsAPIStatusInvalidRequest;
extern NSString *const DTGoogleDirectionsAPIStatusOverQueryLimit;
extern NSString *const DTGoogleDirectionsAPIStatusRequestDenied;
extern NSString *const DTGoogleDirectionsAPIStatusUnknownError;

extern NSString *const DTGoogleDirectionsAPIRoutesKey;
extern NSString *const DTGoogleDirectionsAPILegsKey;
extern NSString *const DTGoogleDirectionsAPIStepsKey;
extern NSString *const DTGoogleDirectionsAPIPointsKey;
extern NSString *const DTGoogleDirectionsAPILevelsKey;

extern NSString *const DTGoogleDirectionsAPISummaryKey;

extern NSString *const DTGoogleDirectionsAPICopyrightsKey;
extern NSString *const DTGoogleDirectionsAPIDistanceKey;
extern NSString *const DTGoogleDirectionsAPIDurationKey;
extern NSString *const DTGoogleDirectionsAPIValueKey;
extern NSString *const DTGoogleDirectionsAPITextKey;
extern NSString *const DTGoogleDirectionsAPIPolylineKey;
extern NSString *const DTGoogleDirectionsAPIOverviewPolylineKey;
extern NSString *const DTGoogleDirectionsAPILatitudeKey;
extern NSString *const DTGoogleDirectionsAPILongitudeKey;
extern NSString *const DTGoogleDirectionsAPIStartLocationKey;
extern NSString *const DTGoogleDirectionsAPIEndLocationKey;
extern NSString *const DTGoogleDirectionsAPIStartAddressKey;
extern NSString *const DTGoogleDirectionsAPIEndAddressKey;

extern NSString *const DTGoogleDirectionsAPIInstructionsKey;

@interface DCTGoogleMapsDirectionsConnectionController : DCTGoogleMapsConnectionController {}

@property (nonatomic, copy) NSString *startString, *endString;
@property (nonatomic, retain) CLLocation *startLocation, *endLocation;
@property (nonatomic, retain) DCTGoogleMapsPlace *startPlace, *endPlace;

+ (CLLocation *)locationFromDictionary:(NSDictionary *)dictionary;

@end
