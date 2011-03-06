//
//  DCTGoogleMapsSearch.h
//  DCTGoogleMaps
//
//  Created by Daniel Tull on 06.03.2011.
//  Copyright (c) 2011 Daniel Tull. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class DCTGoogleMapsPlace;

@interface DCTGoogleMapsSearch : NSManagedObject {
@private
}
@property (nonatomic, retain) NSString * searchString;
@property (nonatomic, retain) DCTGoogleMapsPlace * place;

@end
