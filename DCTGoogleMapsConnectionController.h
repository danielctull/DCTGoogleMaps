//
//  DCTGoogleMapsConnectionController.h
//  DCTGoogleMaps
//
//  Created by Daniel Tull on 21.02.2011.
//  Copyright 2011 Daniel Tull. All rights reserved.
//

#import "DCTRESTController.h"
#import <CoreData/CoreData.h>

@interface DCTGoogleMapsConnectionController : DCTRESTController {}

@property (nonatomic, retain) NSManagedObjectContext *managedObjectContext;

@end
