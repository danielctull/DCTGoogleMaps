//
//  DCTGoogleMapsPlace+Implementation.m
//  DCTGoogleMaps
//
//  Created by Daniel Tull on 21.02.2011.
//  Copyright 2011 Daniel Tull. All rights reserved.
//

#import "DCTGoogleMapsPlace+Implementation.h"
#import "DCTGoogleMapsGeocodingConnectionController.h"
#import <CoreLocation/CoreLocation.h>

@interface DCTGoogleMapsPlace ()
- (void)dctInternal_geocode;
@end

@implementation DCTGoogleMapsPlace (Implementation)

- (NSString *)address {
	return [NSString stringWithFormat:@"%@, %@", self.postcode, self.country];
}

- (void)dctInternal_geocode {
	
	DCTGoogleMapsGeocodingConnectionController *cc = [DCTGoogleMapsGeocodingConnectionController connectionController];
	
	cc.location = self.location;
	cc.address = self.address;
}

- (BOOL)dct_setSerializedValue:(id)value forKey:(NSString *)key {
	
	if ([key isEqualToString:@"geometry"]) {
		
		NSNumber *lat = [value objectForKey:@"lat"];
		NSNumber *lng = [value objectForKey:@"lng"];
		
		CLLocation *l = [[CLLocation alloc] initWithLatitude:[lat doubleValue]
												   longitude:[lng doubleValue]];
		self.location = l;
		[l release];
		return YES;
	}
	
	if ([key isEqualToString:@"address_components"]) {
		
		NSArray *types = [value objectForKey:@"types"];
		
		if ([types containsObject:@"postal_code"]) {
			self.postcode = [value objectForKey:@"long_name"];
		} else if ([types containsObject:@"country"]) {
			self.country = [value objectForKey:@"long_name"];
		}
		
		return YES;
	}
	
	return [super dct_setSerializedValue:value forKey:key];
}

@end
