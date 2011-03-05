//
//  DCTGoogleMapsDirection+Implementation.m
//  DCTGoogleMaps
//
//  Created by Daniel Tull on 22.02.2011.
//  Copyright 2011 Daniel Tull. All rights reserved.
//

#import "DCTGoogleMapsDirection+Implementation.h"
#import "DCTGoogleMapsPlace.h"
#import "DCTGoogleMapsDirectionsConnectionController.h"
#import "NSManagedObjectContext+DCTDataFetching.h"
#import "NSPredicate+DCTExtras.h"

@implementation DCTGoogleMapsDirection (Implementation)

+ (void)directionFromPlace:(DCTGoogleMapsPlace *)fromPlace
				   toPlace:(DCTGoogleMapsPlace *)toPlace
			directionBlock:(DCTGoogleMapsDirectionBlock)block {
	
	NSManagedObjectContext *moc = [fromPlace managedObjectContext];
	
	NSPredicate *fromPredicate = [NSPredicate dct_predicateWhereProperty:@"startPlace" equals:fromPlace];
	NSPredicate *toPredicate = [NSPredicate dct_predicateWhereProperty:@"endPlace" equals:toPlace];
	NSArray *predicates = [NSArray arrayWithObjects:fromPredicate, toPredicate, nil];
	NSPredicate *predicate = [NSCompoundPredicate andPredicateWithSubpredicates:predicates];
	
	DCTGoogleMapsDirection *direction = [moc dct_fetchAnyObjectForEntityName:@"DCTGoogleMapsDirection" predicate:predicate];
	
	if ((direction)) {
		block(direction);
		return;
	}
	
	DCTGoogleMapsDirectionsConnectionController *cc = [DCTGoogleMapsDirectionsConnectionController connectionController];
	cc.startPlace = fromPlace;
	cc.endPlace = toPlace;
	cc.managedObjectContext = moc;
	
	[cc addCompletionBlock:^(NSObject *object) {
		if ([object isKindOfClass:[DCTGoogleMapsDirection class]])
			block((DCTGoogleMapsDirection *)object);
	}];
	
	[cc connect];
}

@end
