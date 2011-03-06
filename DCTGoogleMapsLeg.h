//
//  DCTGoogleMapsLeg.h
//  DCTGoogleMaps
//
//  Created by Daniel Tull on 06.03.2011.
//  Copyright (c) 2011 Daniel Tull. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class DCTGoogleMapsLeg, DCTGoogleMapsPlace, DCTGoogleMapsRoute, DCTGoogleMapsStep;

@interface DCTGoogleMapsLeg : NSManagedObject {
@private
}
@property (nonatomic, retain) NSString * durationString;
@property (nonatomic, retain) NSString * distanceString;
@property (nonatomic, retain) id endLocation;
@property (nonatomic, retain) NSString * endAddress;
@property (nonatomic, retain) id startLocation;
@property (nonatomic, retain) NSNumber * dctOrderedObjectIndex;
@property (nonatomic, retain) NSNumber * duration;
@property (nonatomic, retain) NSString * startAddress;
@property (nonatomic, retain) NSNumber * distance;
@property (nonatomic, retain) DCTGoogleMapsPlace * endPlace;
@property (nonatomic, retain) DCTGoogleMapsLeg * dctPreviousOrderedObject;
@property (nonatomic, retain) DCTGoogleMapsPlace * startPlace;
@property (nonatomic, retain) DCTGoogleMapsLeg * dctNextOrderedObject;
@property (nonatomic, retain) DCTGoogleMapsRoute * route;
@property (nonatomic, retain) NSSet* steps;

@end
