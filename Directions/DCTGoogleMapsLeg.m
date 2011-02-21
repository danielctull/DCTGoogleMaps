//
//  DCTGoogleMapsLeg.m
//  DCTGoogleMaps
//
//  Created by Daniel Tull on 21.02.2011.
//  Copyright (c) 2011 Daniel Tull. All rights reserved.
//

#import "DCTGoogleMapsLeg.h"
#import ".h"


@implementation DCTGoogleMapsLeg
@dynamic distance;
@dynamic distanceString;
@dynamic dctOrderedObjectIndex;
@dynamic duration;
@dynamic durationString;
@dynamic endAddress;
@dynamic endLocation;
@dynamic startAddress;
@dynamic startLocation;
@dynamic dctNextOrderedObject;
@dynamic dctPreviousOrderedObject;
@dynamic route;
@dynamic steps;




- (void)addStepsObject:( *)value {    
    NSSet *changedObjects = [[NSSet alloc] initWithObjects:&value count:1];
    [self willChangeValueForKey:@"steps" withSetMutation:NSKeyValueUnionSetMutation usingObjects:changedObjects];
    [[self primitiveValueForKey:@"steps"] addObject:value];
    [self didChangeValueForKey:@"steps" withSetMutation:NSKeyValueUnionSetMutation usingObjects:changedObjects];
    [changedObjects release];
}

- (void)removeStepsObject:( *)value {
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
