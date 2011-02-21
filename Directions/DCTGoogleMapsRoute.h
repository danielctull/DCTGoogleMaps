//
//  DCTGoogleMapsRoute.h
//  DCTGoogleMaps
//
//  Created by Daniel Tull on 21.02.2011.
//  Copyright (c) 2011 Daniel Tull. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class DCTGoogleMapsDirection;

@interface DCTGoogleMapsRoute : NSManagedObject {
@private
}
@property (nonatomic, retain) NSString * copyrights;
@property (nonatomic, retain) NSString * overviewPolylineString;
@property (nonatomic, retain) NSString * summary;
@property (nonatomic, retain) DCTGoogleMapsDirection * direction;
@property (nonatomic, retain) NSSet* legs;

@end
