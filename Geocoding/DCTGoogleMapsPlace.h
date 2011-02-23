//
//  DCTGoogleMapsPlace.h
//  DCTGoogleMaps
//
//  Created by Daniel Tull on 23.02.2011.
//  Copyright (c) 2011 Daniel Tull. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class DCTGoogleMapsDirection, DCTGoogleMapsLeg;

@interface DCTGoogleMapsPlace : NSManagedObject {
@private
}
@property (nonatomic, retain) NSString * country;
@property (nonatomic, retain) NSString * postcode;
@property (nonatomic, retain) id location;
@property (nonatomic, retain) DCTGoogleMapsLeg * startOfLegs;
@property (nonatomic, retain) DCTGoogleMapsLeg * endOfLegs;
@property (nonatomic, retain) DCTGoogleMapsDirection * directionEnds;
@property (nonatomic, retain) DCTGoogleMapsDirection * directionStarts;

@end
