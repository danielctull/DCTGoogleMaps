//
//  DCTGoogleMapsStep.h
//  DCTGoogleMaps
//
//  Created by Daniel Tull on 06.03.2011.
//  Copyright (c) 2011 Daniel Tull. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class DCTGoogleMapsLeg, DCTGoogleMapsStep;

@interface DCTGoogleMapsStep : NSManagedObject {
@private
}
@property (nonatomic, retain) NSString * durationString;
@property (nonatomic, retain) NSString * distanceString;
@property (nonatomic, retain) id endLocation;
@property (nonatomic, retain) id startLocation;
@property (nonatomic, retain) NSString * polylineString;
@property (nonatomic, retain) NSNumber * dctOrderedObjectIndex;
@property (nonatomic, retain) NSNumber * duration;
@property (nonatomic, retain) NSNumber * distance;
@property (nonatomic, retain) NSString * instructions;
@property (nonatomic, retain) DCTGoogleMapsStep * dctPreviousOrderedObject;
@property (nonatomic, retain) DCTGoogleMapsStep * dctNextOrderedObject;
@property (nonatomic, retain) DCTGoogleMapsLeg * leg;

@end
