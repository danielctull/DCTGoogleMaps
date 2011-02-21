//
//  DCTGoogleMapsPlace.h
//  DCTGoogleMaps
//
//  Created by Daniel Tull on 21.02.2011.
//  Copyright (c) 2011 Daniel Tull. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class DCTGoogleMapsLeg;

@interface DCTGoogleMapsPlace : NSManagedObject {
@private
}
@property (nonatomic, retain) NSString * country;
@property (nonatomic, retain) NSString * postcode;
@property (nonatomic, retain) id location;
@property (nonatomic, retain) DCTGoogleMapsLeg * endOfLegs;
@property (nonatomic, retain) DCTGoogleMapsLeg * startOfLegs;

@end
