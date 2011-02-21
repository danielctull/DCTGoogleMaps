//
//  DCTGoogleMapsLeg.h
//  DCTGoogleMaps
//
//  Created by Daniel Tull on 21.02.2011.
//  Copyright (c) 2011 Daniel Tull. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class ;

@interface DCTGoogleMapsLeg : NSManagedObject {
@private
}
@property (nonatomic, retain) NSNumber * distance;
@property (nonatomic, retain) NSString * distanceString;
@property (nonatomic, retain) NSNumber * dctOrderedObjectIndex;
@property (nonatomic, retain) NSNumber * duration;
@property (nonatomic, retain) NSString * durationString;
@property (nonatomic, retain) NSString * endAddress;
@property (nonatomic, retain) id endLocation;
@property (nonatomic, retain) NSString * startAddress;
@property (nonatomic, retain) id startLocation;
@property (nonatomic, retain)  * dctNextOrderedObject;
@property (nonatomic, retain)  * dctPreviousOrderedObject;
@property (nonatomic, retain)  * route;
@property (nonatomic, retain) NSSet* steps;

@end
