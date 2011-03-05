//
//  DCTGoogleMapsDirection+Implementation.h
//  DCTGoogleMaps
//
//  Created by Daniel Tull on 22.02.2011.
//  Copyright 2011 Daniel Tull. All rights reserved.
//

#import "DCTGoogleMapsDirection.h"
#import "NSManagedObject+DCTAutomatedSetup.h"

typedef void (^DCTGoogleMapsDirectionBlock) (DCTGoogleMapsDirection *direction);

@interface DCTGoogleMapsDirection (Implementation) <DCTManagedObjectAutomatedSetup>

+ (void)directionFromPlace:(DCTGoogleMapsPlace *)fromPlace
				   toPlace:(DCTGoogleMapsPlace *)toPlace
			directionBlock:(DCTGoogleMapsDirectionBlock)block;

@end
