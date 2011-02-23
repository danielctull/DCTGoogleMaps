//
//  DCTGoogleMapsDirection.h
//  DCTGoogleMaps
//
//  Created by Daniel Tull on 23.02.2011.
//  Copyright (c) 2011 Daniel Tull. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class DCTGoogleMapsPlace, DCTGoogleMapsRoute;

@interface DCTGoogleMapsDirection : NSManagedObject {
@private
}
@property (nonatomic, retain) id startLocation;
@property (nonatomic, retain) id endLocation;
@property (nonatomic, retain) NSString * endString;
@property (nonatomic, retain) NSString * startString;
@property (nonatomic, retain) NSSet* routes;
@property (nonatomic, retain) DCTGoogleMapsPlace * startPlace;
@property (nonatomic, retain) DCTGoogleMapsPlace * endPlace;

@end
