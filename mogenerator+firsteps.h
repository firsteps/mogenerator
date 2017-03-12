//
//  mogenerator+firsteps.h
//  mogenerator
//
//  Created by Dmitry Makarenko on 06/03/2017.
//  Copyright © 2017 firsteps. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>


////////////////////////////////////////////////////////////////////////////////
@interface NSEntityDescription (firsteps)

- (NSString *)firsteps_stateClassName;
- (NSString *)firsteps_stateSuperclassName;

- (NSString *)firsteps_stateDataClassName;
- (NSString *)firsteps_stateDataSuperclassName;

@end

////////////////////////////////////////////////////////////////////////////////
@interface NSPropertyDescription (firsteps)

@end

////////////////////////////////////////////////////////////////////////////////
@interface NSAttributeDescription (firsteps)

@end

////////////////////////////////////////////////////////////////////////////////
@interface NSRelationshipDescription (firsteps)

@end
