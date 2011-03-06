//
//  DCTGoogleMapsPlace.h
//  DCTGoogleMaps
//
//  Created by Daniel Tull on 06.03.2011.
//  Copyright (c) 2011 Daniel Tull. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>
#import <CoreLocation/CoreLocation.h>

@class DCTGoogleMapsDirection, DCTGoogleMapsLeg, DCTGoogleMapsSearch;

@interface DCTGoogleMapsPlace : NSManagedObject {
@private
}
@property (nonatomic, retain) CLLocation *location;
@property (nonatomic, retain) NSString * country;
@property (nonatomic, retain) NSString * postcode;
@property (nonatomic, retain) DCTGoogleMapsDirection * endOfDirections;
@property (nonatomic, retain) DCTGoogleMapsDirection * startOfDirections;
@property (nonatomic, retain) DCTGoogleMapsLeg * startOfLegs;
@property (nonatomic, retain) DCTGoogleMapsLeg * endOfLegs;
@property (nonatomic, retain) NSSet* searches;

@end
