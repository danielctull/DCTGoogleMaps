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

@implementation DCTGoogleMapsStep (Implementation)

@dynamic dctOrderedObjectIndex;

+ (NSDictionary *)dct_mappingFromRemoteNamesToLocalNames {
	NSMutableDictionary *dict = [[NSMutableDictionary alloc] init];
	[dict setValue:DCTGoogleMapsStepAttributeInstructions forKey:DCTGoogleMapsInstructions];
	return [dict autorelease];
}

- (BOOL)dct_setSerializedValue:(id)value forKey:(NSString *)key {
	
	if ([key isEqualToString:DCTGoogleMapsDistance]) {
		self.distanceString = [value objectForKey:DCTGoogleMapsText];
		self.distance = [value objectForKey:DCTGoogleMapsValue];
		return YES;
	}
	
	if ([key isEqualToString:DCTGoogleMapsDuration]) {
		self.durationString = [value objectForKey:DCTGoogleMapsText];
		self.duration = [value objectForKey:DCTGoogleMapsValue];
		return YES;
	}
	
	if ([key isEqualToString:DCTGoogleMapsEndLocation]) {
		self.endLocation = [DCTGoogleMapsConnectionController locationFromDictionary:value];
		return YES;
	}
	
	if ([key isEqualToString:DCTGoogleMapsStartLocation]) {
		self.startLocation = [DCTGoogleMapsConnectionController locationFromDictionary:value];
		return YES;
	}
	
	if ([key isEqualToString:DCTGoogleMapsPolyline]) {
		self.polylineString = [value objectForKey:DCTGoogleMapsPoints];
		return YES;
	}
	
	return [super dct_setSerializedValue:value forKey:key];
}

@end
