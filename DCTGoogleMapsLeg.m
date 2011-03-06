//
//  DCTGoogleMapsLeg.m
//  DCTGoogleMaps
//
//  Created by Daniel Tull on 06.03.2011.
//  Copyright (c) 2011 Daniel Tull. All rights reserved.
//

#import "DCTGoogleMapsLeg.h"
#import "DCTGoogleMapsLeg.h"
#import "DCTGoogleMapsPlace.h"
#import "DCTGoogleMapsRoute.h"
#import "DCTGoogleMapsStep.h"


@implementation DCTGoogleMapsLeg
@dynamic durationString;
@dynamic distanceString;
@dynamic endLocation;
@dynamic endAddress;
@dynamic startLocation;
@dynamic dctOrderedObjectIndex;
@dynamic duration;
@dynamic startAddress;
@dynamic distance;
@dynamic endPlace;
@dynamic dctPreviousOrderedObject;
@dynamic startPlace;
@dynamic dctNextOrderedObject;
@dynamic route;
@dynamic steps;






- (void)addStepsObject:(DCTGoogleMapsStep *)value {    
    NSSet *changedObjects = [[NSSet alloc] initWithObjects:&value count:1];
    [self willChangeValueForKey:@"steps" withSetMutation:NSKeyValueUnionSetMutation usingObjects:changedObjects];
    [[self primitiveValueForKey:@"steps"] addObject:value];
    [self didChangeValueForKey:@"steps" withSetMutation:NSKeyValueUnionSetMutation usingObjects:changedObjects];
    [changedObjects release];
}

- (void)removeStepsObject:(DCTGoogleMapsStep *)value {
    NSSet *changedObjects = [[NSSet alloc] initWithObjects:&value count:1];
    [self willChangeValueForKey:@"steps" withSetMutation:NSKeyValueMinusSetMutation usingObjects:changedObjects];
    [[self primitiveValueForKey:@"steps"] removeObject:value];
    [self didChangeValueForKey:@"steps" withSetMutation:NSKeyValueMinusSetMutation usingObjects:changedObjects];
    [changedObjects release];
}

- (void)addSteps:(NSSet *)value {    
    [self willChangeValueForKey:@"steps" withSetMutation:NSKeyValueUnionSetMutation usingObjects:value];
    [[self primitiveValueForKey:@"steps"] unionSet:value];
    [self didChangeValueForKey:@"steps" withSetMutation:NSKeyValueUnionSetMutation usingObjects:value];
}

- (void)removeSteps:(NSSet *)value {
    [self willChangeValueForKey:@"steps" withSetMutation:NSKeyValueMinusSetMutation usingObjects:value];
    [[self primitiveValueForKey:@"steps"] minusSet:value];
    [self didChangeValueForKey:@"steps" withSetMutation:NSKeyValueMinusSetMutation usingObjects:value];
}


@end
