//
//  MKPolyline+DCTGoogleEncoding.m
//  DCTGoogleMaps
//
//  Created by Daniel Tull on 13.07.2010.
//  Copyright 2010 Daniel Tull. All rights reserved.
//

#import "MKPolyline+DCTGoogleEncoding.h"

@implementation MKPolyline (DCTGoogleEncoding)

+ (MKPolyline *)dct_polylineWithGoogleEncodedString:(NSString *)string {
	
	NSMutableArray *thePoints = [[[NSMutableArray alloc] init] autorelease];
	
	NSInteger length = [string length];
	NSInteger index = 0;
	NSInteger latitude = 0;
	NSInteger longitude = 0;
	BOOL isLatitude = YES;
	
	while (index < length) {
		
		NSInteger buffer = 0;
		NSInteger shift = 0;
		NSInteger result = 0;
		
		do {
			[string getBytes:&buffer maxLength:1 usedLength:NULL encoding:NSASCIIStringEncoding options:0 range:NSMakeRange(index, 1) remainingRange:NULL];
			buffer -= 63;
			//NSLog(@"%@:latitude %@ 0x%02x", self, [string substringWithRange:NSMakeRange(index, 1)], b);
			index++;
			result |= (buffer & 0x1f) << shift;
			shift += 5;
		} while (buffer >= 0x20);
		
		result = ((result & 1) ? ~(result >> 1) : (result >> 1));
		
		if (isLatitude) {
			latitude += result;
			[thePoints addObject:[NSNumber numberWithDouble:(latitude * 1e-5)]];
		} else {
			longitude += result;
			[thePoints addObject:[NSNumber numberWithDouble:(longitude * 1e-5)]];
		}
		
		isLatitude = !isLatitude;
	}
	
	//NSLog(@"%@:%s %@", self, _cmd, thePoints);
	
	NSInteger numberOfPoints = [thePoints count]/2;
	
	//NSLog(@"%@:%s %i", self, _cmd, numberOfPoints);
	
	CLLocationCoordinate2D coords[numberOfPoints];
	
	
	for (NSInteger i = 0; i < numberOfPoints; i++) {
		//NSLog(@"%@:%s %i", self, _cmd, i);
		NSNumber *latitudeNumber = [thePoints objectAtIndex:(i*2)];
		NSNumber *longitudeNumber = [thePoints objectAtIndex:((i*2)+1)];
		
		CLLocationCoordinate2D location = CLLocationCoordinate2DMake([latitudeNumber doubleValue], [longitudeNumber doubleValue]);
		coords[i] = location;
		
	}
	
	return [self polylineWithCoordinates:coords count:numberOfPoints];
}

@end
