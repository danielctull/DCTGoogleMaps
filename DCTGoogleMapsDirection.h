//
//  DCTGoogleMapsDirection.h
//  DCTGoogleMaps
//
//  Created by Daniel Tull on 06.03.2011.
//  Copyright (c) 2011 Daniel Tull. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class DCTGoogleMapsPlace, DCTGoogleMapsRoute;

@interface DCTGoogleMapsDirection : NSManagedObject {
@private
}
@property (nonatomic, retain) NSSet* routes;
@property (nonatomic, retain) DCTGoogleMapsPlace * endPlace;
@property (nonatomic, retain) DCTGoogleMapsPlace * startPlace;

@end
