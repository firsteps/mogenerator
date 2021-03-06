//
//  mogenerator+firsteps.m
//  mogenerator
//
//  Created by Dmitry Makarenko on 06/03/2017.
//  Copyright © 2017 firsteps. All rights reserved.
//

#import "mogenerator+firsteps.h"

#import "mogenerator+CTX.h"

#import "mogenerator.h"

static NSString *stateClassNameForManagedObjectClassName(NSString *managedObjectClassName)
{
    return CTX_normalizedManagedObjectClassName(managedObjectClassName);
}

@implementation NSEntityDescription (firsteps)

- (NSString *)firsteps_stateClassName
{
    return stateClassNameForManagedObjectClassName([self managedObjectClassName]);
}

- (NSString *)firsteps_stateSuperclassName
{
    if ([self CTX_hasCustomSuperEntity]) {
        return [[self superentity] firsteps_stateClassName];
    }
    return @"NSObject";
}

- (NSString *)firsteps_stateDataClassName
{
    return [NSString stringWithFormat:@"%@Data", stateClassNameForManagedObjectClassName([self managedObjectClassName])];
}

- (NSString *)firsteps_stateDataSuperclassName
{
    if ([self CTX_hasCustomSuperEntity]) {
        return [[self superentity] firsteps_stateDataClassName];
    }
    return @"NSObject";
}

@end

@implementation NSPropertyDescription (firsteps)

@end

@implementation NSAttributeDescription (firsteps)

@end

@implementation NSRelationshipDescription (firsteps)

@end
