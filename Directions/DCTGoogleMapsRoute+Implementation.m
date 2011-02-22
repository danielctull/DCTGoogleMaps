//
//  DCTGoogleMapsRoute+Implementation.m
//  DCTGoogleMaps
//
//  Created by Daniel Tull on 22.02.2011.
//  Copyright 2011 Daniel Tull. All rights reserved.
//

#import "DCTGoogleMapsRoute+Implementation.h"
#import "DCTGoogleMapsConnectionController.h"

@implementation DCTGoogleMapsRoute (Implementation)

- (BOOL)dct_setSerializedValue:(id)value forKey:(NSString *)key {
	
	if ([key isEqualToString:DCTGoogleMapsPolyline]) {
		self.overviewPolylineString = [value objectForKey:DCTGoogleMapsPoints];
		return YES;
	}
	
	return [super dct_setSerializedValue:value forKey:key];
}

@end
