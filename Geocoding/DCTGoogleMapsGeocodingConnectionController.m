//
//  DCTGoogleMapsGeocodingConnectionController.m
//  DCTGoogleMaps
//
//  Created by Daniel Tull on 21.02.2011.
//  Copyright 2011 Daniel Tull. All rights reserved.
//

#import "DCTGoogleMapsGeocodingConnectionController.h"
#import "JSON.h"
#import "DCTGoogleMapsPlace+Implementation.h"
#import "NSArray+DCTExtras.h"

@implementation DCTGoogleMapsGeocodingConnectionController

@synthesize address, bounds, region, language, location;

- (NSString *)baseURLString {
	return @"http://maps.google.com/maps/api/geocode/json";
}

+ (NSArray *)queryProperties {
	return [NSArray arrayWithObjects:@"address", @"bounds", @"region", @"language", @"latlng", nil];
}

- (NSString *)latlng {
	if (!self.location) return nil;
	
	return [NSString stringWithFormat:@"%f,%f", self.location.coordinate.latitude, self.location.coordinate.longitude];
}

- (void)receivedObject:(NSObject *)object {
	
	if (![object isKindOfClass:[NSData class]]) return [super receivedObject:object];
	
	NSData *data = (NSData *)object;
	
	NSString *dataString = [[[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding] autorelease];
	
	SBJsonParser *jsonParser = [SBJsonParser new];
	
	NSError *err = nil;
	NSDictionary *dict = [jsonParser objectWithString:dataString error:&err];
	
	NSLog(@"%@:%@ %@", self, NSStringFromSelector(_cmd), dict);
	
	[jsonParser release];
	
	NSArray *results = [dict objectForKey:@"results"];
	
	NSMutableArray *returnResults = [[NSMutableArray alloc] initWithCapacity:[results count]];
	
	NSManagedObjectContext *context = self.managedObjectContext;
	
	for (NSDictionary *result in results) {
		
		DCTGoogleMapsPlace *place = [DCTGoogleMapsPlace dct_objectFromDictionary:result 
												  insertIntoManagedObjectContext:context];
		
		[returnResults addObject:place];
	}
	
	if ([returnResults count] == 1)
		return [super receivedObject:[returnResults dct_firstObject]];
	
	
	NSArray *returnArray = [NSArray arrayWithArray:returnResults];
	
	[super receivedObject:returnArray];
}

@end
