//
//  DCTGoogleMapsAppDelegate.h
//  DCTGoogleMaps
//
//  Created by Daniel Tull on 20.02.2011.
//  Copyright 2011 Daniel Tull. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreData/CoreData.h>

@interface DCTGoogleMapsAppDelegate : NSObject <UIApplicationDelegate> {

}

@property (nonatomic, retain) IBOutlet UIWindow *window;
@property (nonatomic, retain) NSManagedObjectContext *managedObjectContext;

@end
