//
//  DCTGoogleMapsDirection.m
//  DCTGoogleMaps
//
//  Created by Daniel Tull on 21.02.2011.
//  Copyright (c) 2011 Daniel Tull. All rights reserved.
//

#import "DCTGoogleMapsDirection.h"
#import ".h"


@implementation DCTGoogleMapsDirection
@dynamic endLocation;
@dynamic endString;
@dynamic startLocation;
@dynamic startString;
@dynamic routes;

- (void)addRoutesObject:( *)value {    
    NSSet *changedObjects = [[NSSet alloc] initWithObjects:&value count:1];
    [self willChangeValueForKey:@"routes" withSetMutation:NSKeyValueUnionSetMutation usingObjects:changedObjects];
    [[self primitiveValueForKey:@"routes"] addObject:value];
    [self didChangeValueForKey:@"routes" withSetMutation:NSKeyValueUnionSetMutation usingObjects:changedObjects];
    [changedObjects release];
}

- (void)removeRoutesObject:( *)value {
    NSSet *changedObjects = [[NSSet alloc] initWithObjects:&value count:1];
    [self willChangeValueForKey:@"routes" withSetMutation:NSKeyValueMinusSetMutation usingObjects:changedObjects];
    [[self primitiveValueForKey:@"routes"] removeObject:value];
    [self didChangeValueForKey:@"routes" withSetMutation:NSKeyValueMinusSetMutation usingObjects:changedObjects];
    [changedObjects release];
}

- (void)addRoutes:(NSSet *)value {    
    [self willChangeValueForKey:@"routes" withSetMutation:NSKeyValueUnionSetMutation usingObjects:value];
    [[self primitiveValueForKey:@"routes"] unionSet:value];
    [self didChangeValueForKey:@"routes" withSetMutation:NSKeyValueUnionSetMutation usingObjects:value];
}

- (void)removeRoutes:(NSSet *)value {
    [self willChangeValueForKey:@"routes" withSetMutation:NSKeyValueMinusSetMutation usingObjects:value];
    [[self primitiveValueForKey:@"routes"] minusSet:value];
    [self didChangeValueForKey:@"routes" withSetMutation:NSKeyValueMinusSetMutation usingObjects:value];
}


@end
