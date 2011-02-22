//
//  DCTGoogleMapsStep+Implementation.m
//  DCTGoogleMaps
//
//  Created by Daniel Tull on 22.02.2011.
//  Copyright 2011 Daniel Tull. All rights reserved.
//

#import "DCTGoogleMapsStep+Implementation.h"
#import "DCTGoogleMapsConnectionController.h"

NSString *const DCTGoogleMapsStepEntityName = @"DCTGoogleMapsStep";
NSString *const DCTGoogleMapsStepAttributeDistance = @"distance";
NSString *const DCTGoogleMapsStepAttributeDistanceString = @"distanceString";
NSString *const DCTGoogleMapsStepAttributeDuration = @"duration";
NSString *const DCTGoogleMapsStepAttributeDurationString = @"durationString";
NSString *const DCTGoogleMapsStepAttributeEndCoordinate = @"endCoordinate";
NSString *const DCTGoogleMapsStepAttributeInstructions = @"instructions";
NSString *const DCTGoogleMapsStepAttributePolylineString = @"polylineString";
NSString *const DCTGoogleMapsStepAttributeStartCoordinate = @"startCoordinate";
NSString *const DCTGoogleMapsStepRelationshipLeg = @"leg";

extern NSString *const DCTGoogleMapsAPICopyrightsKey;
extern NSString *const DCTGoogleMapsAPIDistanceKey;
extern NSString *const DCTGoogleMapsAPIDurationKey;
extern NSString *const DCTGoogleMapsAPIValueKey;
extern NSString *const DCTGoogleMapsAPITextKey;
extern NSString *const DCTGoogleMapsAPIPolylineKey;
extern NSString *const DCTGoogleMapsAPIOverviewPolylineKey;
extern NSString *const DCTGoogleMapsAPILatitudeKey;
extern NSString *const DCTGoogleMapsAPILongitudeKey;
extern NSString *const DCTGoogleMapsAPIStartLocationKey;
extern NSString *const DCTGoogleMapsAPIEndLocationKey;
extern NSString *const DCTGoogleMapsAPIStartAddressKey;
extern NSString *const DCTGoogleMapsAPIEndAddressKey;

@implementation DCTGoogleMapsStep (Implementation)

+ (NSDictionary *)dct_mappingFromRemoteNamesToLocalNames {
	NSMutableDictionary *dict = [[NSMutableDictionary alloc] init];
	[dict setValue:DCTGoogleMapsStepAttributeInstructions forKey:DCTGoogleMapsAPIInstructions];
	return [dict autorelease];
}

- (BOOL)dct_setSerializedValue:(id)value forKey:(NSString *)key {
	
	if ([key isEqualToString:DCTGoogleMapsAPIDistance]) {
		self.distanceString = [value objectForKey:DCTGoogleMapsAPIText];
		self.distance = [value objectForKey:DCTGoogleMapsAPIValue];
		return YES;
	}
	
	if ([key isEqualToString:DCTGoogleMapsAPIDuration]) {
		self.durationString = [value objectForKey:DCTGoogleMapsAPIText];
		self.duration = [value objectForKey:DCTGoogleMapsAPIValue];
		return YES;
	}
	
	if ([key isEqualToString:DCTGoogleMapsAPIEndLocation]) {
		self.endLocation = [DCTGoogleMapsConnectionController locationFromDictionary:value];
		return YES;
	}
	
	if ([key isEqualToString:DCTGoogleMapsAPIStartLocation]) {
		self.startLocation = [DCTGoogleMapsConnectionController locationFromDictionary:value];
		return YES;
	}
	
	if ([key isEqualToString:DCTGoogleMapsAPIPolyline]) {
		self.polylineString = [value objectForKey:DCTGoogleMapsAPIPoints];
		return YES;
	}
	
	return [super dct_setSerializedValue:value forKey:key];
}

@end
