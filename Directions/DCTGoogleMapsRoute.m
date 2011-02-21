//
//  DCTGoogleMapsRoute.m
//  DCTGoogleMaps
//
//  Created by Daniel Tull on 21.02.2011.
//  Copyright (c) 2011 Daniel Tull. All rights reserved.
//

#import "DCTGoogleMapsRoute.h"
#import ".h"


@implementation DCTGoogleMapsRoute
@dynamic copyrights;
@dynamic overviewPolylineString;
@dynamic summary;
@dynamic direction;
@dynamic legs;


- (void)addLegsObject:( *)value {    
    NSSet *changedObjects = [[NSSet alloc] initWithObjects:&value count:1];
    [self willChangeValueForKey:@"legs" withSetMutation:NSKeyValueUnionSetMutation usingObjects:changedObjects];
    [[self primitiveValueForKey:@"legs"] addObject:value];
    [self didChangeValueForKey:@"legs" withSetMutation:NSKeyValueUnionSetMutation usingObjects:changedObjects];
    [changedObjects release];
}

- (void)removeLegsObject:( *)value {
    NSSet *changedObjects = [[NSSet alloc] initWithObjects:&value count:1];
    [self willChangeValueForKey:@"legs" withSetMutation:NSKeyValueMinusSetMutation usingObjects:changedObjects];
    [[self primitiveValueForKey:@"legs"] removeObject:value];
    [self didChangeValueForKey:@"legs" withSetMutation:NSKeyValueMinusSetMutation usingObjects:changedObjects];
    [changedObjects release];
}

- (void)addLegs:(NSSet *)value {    
    [self willChangeValueForKey:@"legs" withSetMutation:NSKeyValueUnionSetMutation usingObjects:value];
    [[self primitiveValueForKey:@"legs"] unionSet:value];
    [self didChangeValueForKey:@"legs" withSetMutation:NSKeyValueUnionSetMutation usingObjects:value];
}

- (void)removeLegs:(NSSet *)value {
    [self willChangeValueForKey:@"legs" withSetMutation:NSKeyValueMinusSetMutation usingObjects:value];
    [[self primitiveValueForKey:@"legs"] minusSet:value];
    [self didChangeValueForKey:@"legs" withSetMutation:NSKeyValueMinusSetMutation usingObjects:value];
}


@end
