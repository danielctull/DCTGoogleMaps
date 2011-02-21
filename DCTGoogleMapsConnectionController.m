//
//  DCTGoogleMapsConnectionController.m
//  DCTGoogleMaps
//
//  Created by Daniel Tull on 21.02.2011.
//  Copyright 2011 Daniel Tull. All rights reserved.
//

#import "DCTGoogleMapsConnectionController.h"


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

@end
