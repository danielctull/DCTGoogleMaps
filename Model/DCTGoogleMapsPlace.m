//
//  DCTGoogleMapsPlace.m
//  DCTGoogleMaps
//
//  Created by Daniel Tull on 06.03.2011.
//  Copyright (c) 2011 Daniel Tull. All rights reserved.
//

#import "DCTGoogleMapsPlace.h"
#import "DCTGoogleMapsDirection.h"
#import "DCTGoogleMapsLeg.h"
#import "DCTGoogleMapsSearch.h"


@implementation DCTGoogleMapsPlace
@dynamic location;
@dynamic country;
@dynamic postcode;
@dynamic endOfDirections;
@dynamic startOfDirections;
@dynamic startOfLegs;
@dynamic endOfLegs;
@dynamic searches;





- (void)addSearchesObject:(DCTGoogleMapsSearch *)value {    
    NSSet *changedObjects = [[NSSet alloc] initWithObjects:&value count:1];
    [self willChangeValueForKey:@"searches" withSetMutation:NSKeyValueUnionSetMutation usingObjects:changedObjects];
    [[self primitiveValueForKey:@"searches"] addObject:value];
    [self didChangeValueForKey:@"searches" withSetMutation:NSKeyValueUnionSetMutation usingObjects:changedObjects];
    [changedObjects release];
}

- (void)removeSearchesObject:(DCTGoogleMapsSearch *)value {
    NSSet *changedObjects = [[NSSet alloc] initWithObjects:&value count:1];
    [self willChangeValueForKey:@"searches" withSetMutation:NSKeyValueMinusSetMutation usingObjects:changedObjects];
    [[self primitiveValueForKey:@"searches"] removeObject:value];
    [self didChangeValueForKey:@"searches" withSetMutation:NSKeyValueMinusSetMutation usingObjects:changedObjects];
    [changedObjects release];
}

- (void)addSearches:(NSSet *)value {    
    [self willChangeValueForKey:@"searches" withSetMutation:NSKeyValueUnionSetMutation usingObjects:value];
    [[self primitiveValueForKey:@"searches"] unionSet:value];
    [self didChangeValueForKey:@"searches" withSetMutation:NSKeyValueUnionSetMutation usingObjects:value];
}

- (void)removeSearches:(NSSet *)value {
    [self willChangeValueForKey:@"searches" withSetMutation:NSKeyValueMinusSetMutation usingObjects:value];
    [[self primitiveValueForKey:@"searches"] minusSet:value];
    [self didChangeValueForKey:@"searches" withSetMutation:NSKeyValueMinusSetMutation usingObjects:value];
}


@end
