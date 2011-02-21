//
//  MKPolyline+DCTGoogleEncoding.h
//  DCTGoogleMaps
//
//  Created by Daniel Tull on 13.07.2010.
//  Copyright 2010 Daniel Tull. All rights reserved.
//

#import <MapKit/MapKit.h>

@interface MKPolyline (DCTGoogleEncoding)

+ (MKPolyline *)dct_polylineWithGoogleEncodedString:(NSString *)string;

@end
