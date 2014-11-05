//
//  mogenerator+CTX.m
//  mogenerator
//
//  Created by Dmitry Makarenko on 21/12/2012.
//
//

#import "mogenerator+CTX.h"

#import "mogenerator.h"

NSString * const kCTXNSPropertyDescriptionShouldNotBePersistedInDTO_key = @"com.ef.ctx.mogenerator.dto.shouldNotBePersisted";
NSString * const kCTXNSPropertyDescriptionIsMandatoryInDTO_key = @"com.ef.ctx.mogenerator.dto.mandatory";
NSString * const kCTXNSRelationshipDescriptionShouldNotBeDeletedWhenUnset_key = @"com.ef.ctx.mogenerator.mo.shouldNotBeDeletedWhenUnset";
NSString * const kCTXNSRelationshipDescriptionShouldBeRepopulatedFromDTOWhenSet_key = @"com.ef.ctx.mogenerator.mo.shouldBeRepopulatedFromDTOWhenSet";

NSString * const kCTXNSPropertyDescriptionDTOClassName_key = @"com.ef.ctx.mogenerator.dto.className";

NSString * const kCTXNSPropertyDescriptionImmutableEntityClassName_key = @"com.ef.ctx.mogenerator.entity.immutable.className";
NSString * const kCTXNSPropertyDescriptionMutableEntityClassName_key = @"com.ef.ctx.mogenerator.entity.mutable.className";


static inline BOOL stringContainsNegativeResponse(NSString *string)
{
    NSString *normalizedString = [[string lowercaseString] stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
    return ([normalizedString isEqualToString:@"no"] ||
            [normalizedString isEqualToString:@"false"]);
}

// String which doesn't contain negative response is considered as containing a positive one.
static inline BOOL stringContainsPositiveResponse(NSString *string)
{
    return (!stringContainsNegativeResponse(string));
}

static NSString *normalizedManagedObjectClassName(NSString *managedObjectClassName)
{
    static NSString * const kMOSuffix = @"MO";

    NSString *normalizedManagedObjectClassName = managedObjectClassName;
    BOOL managedObjectClassNameEndsWithMO = [managedObjectClassName hasSuffix:kMOSuffix];
    if (managedObjectClassNameEndsWithMO) {
        NSRange suffixRange = [normalizedManagedObjectClassName rangeOfString:kMOSuffix options:NSBackwardsSearch];
        normalizedManagedObjectClassName = [normalizedManagedObjectClassName stringByReplacingCharactersInRange:suffixRange withString:@""];
    }
    return normalizedManagedObjectClassName;
}

static NSString *dtoClassNameForManagedObjectClassName(NSString *managedObjectClassName)
{
    return [NSString stringWithFormat:@"%@DTO", normalizedManagedObjectClassName(managedObjectClassName)];
}

static NSString *immutableEntityClassNameForManagedObjectClassName(NSString *managedObjectClassName)
{
    return [NSString stringWithFormat:@"%@ImmutableEntity", normalizedManagedObjectClassName(managedObjectClassName)];
}

static NSString *mutableEntityClassNameForManagedObjectClassName(NSString *managedObjectClassName)
{
    return [NSString stringWithFormat:@"%@MutableEntity", normalizedManagedObjectClassName(managedObjectClassName)];
}

@implementation NSEntityDescription (CTX)

- (BOOL)CTX_hasCustomSuperEntity {
    NSEntityDescription *superentity = [self superentity];
    NSString *managedObjectClassName = ([[superentity managedObjectClassName] length] > 0) ? [superentity managedObjectClassName] : NSStringFromClass([NSManagedObject class]);
    return (superentity && (![managedObjectClassName isEqualToString:NSStringFromClass([NSManagedObject class])]));
}

- (NSString *)CTX_dtoClassName
{
    NSString *value = [self.userInfo objectForKey:kCTXNSPropertyDescriptionDTOClassName_key];
    if (value == nil) {
        value = dtoClassNameForManagedObjectClassName([self managedObjectClassName]);
    }
    return value;
}

- (NSString *)CTX_dtoSuperclassName {
    if ([self CTX_hasCustomSuperEntity]) {
        return [[self superentity] CTX_dtoClassName];
    }
    return @"NSObject";
}

- (NSString *)CTX_immutableEntityClassName
{
    NSString *value = [self.userInfo objectForKey:kCTXNSPropertyDescriptionImmutableEntityClassName_key];
    if (value == nil) {
        value = immutableEntityClassNameForManagedObjectClassName([self managedObjectClassName]);
    }
    return value;
}

- (NSString *)CTX_immutableEntitySuperclassName {
    if ([self CTX_hasCustomSuperEntity]) {
        return [[self superentity] CTX_immutableEntityClassName];
    }
    return @"NSObject";
}

- (NSString *)CTX_mutableEntityClassName
{
    NSString *value = [self.userInfo objectForKey:kCTXNSPropertyDescriptionMutableEntityClassName_key];
    if (value == nil) {
        value = mutableEntityClassNameForManagedObjectClassName([self managedObjectClassName]);
    }
    return value;
}

- (NSString *)CTX_mutableEntitySuperclassName {
    if ([self CTX_hasCustomSuperEntity]) {
        return [[self superentity] CTX_mutableEntityClassName];
    }
    return @"NSObject";
}

- (BOOL)CTX_hasNoninheritedAttributes {
    return ([[self noninheritedAttributes] count] > 0);
}

- (BOOL)CTX_hasNoninheritedAttributesSansType {
    return ([[self noninheritedAttributesSansType] count] > 0);
}

- (BOOL)CTX_hasNoninheritedRelationships {
    return ([[self noninheritedRelationships] count] > 0);
}

- (BOOL)CTX_hasNoninheritedFetchedProperties {
    return ([[self noninheritedFetchedProperties] count] > 0);
}

- (NSArray *)CTX_noninheritedAttributesPersistingInDTO {
    NSMutableArray *result = [NSMutableArray array];
    NSArray *noninheritedAttributes = [self noninheritedAttributes];
    [noninheritedAttributes enumerateObjectsUsingBlock:^(NSPropertyDescription *attribute, NSUInteger idx, BOOL *stop) {
        if ([attribute CTX_shouldBePersistedInDTO]) {
            [result addObject:attribute];
        }
    }];
    return [NSArray arrayWithArray:result];
}

- (NSArray *)CTX_noninheritedRelationshipsPersistingInDTO {
    NSMutableArray *result = [NSMutableArray array];
    NSArray *noninheritedAttributes = [self noninheritedRelationships];
    [noninheritedAttributes enumerateObjectsUsingBlock:^(NSPropertyDescription *attribute, NSUInteger idx, BOOL *stop) {
        if ([attribute CTX_shouldBePersistedInDTO]) {
            [result addObject:attribute];
        }
    }];
    return [NSArray arrayWithArray:result];
}

- (BOOL)CTX_hasNoninheritedAttributesPersistingInDTO {
    return ([[self CTX_noninheritedAttributesPersistingInDTO] count] > 0);
}

- (BOOL)CTX_hasNoninheritedRelationshipsPersistingInDTO {
    return ([[self CTX_noninheritedRelationshipsPersistingInDTO] count ] > 0);
}

@end

@implementation NSPropertyDescription (CTX)

- (BOOL)CTX_shouldBePersistedInDTO
{
    NSString *value = [self.userInfo objectForKey:kCTXNSPropertyDescriptionShouldNotBePersistedInDTO_key];
    if (value != nil) {
        // Method checks for the negative value of User Info's property, because it is intended to be set,
        // when user doesn't want property to be persisted in DTO.
        return stringContainsNegativeResponse(value);
    }
    return YES;
}

- (BOOL)CTX_isMandatoryInDTO
{
    NSString *value = [self.userInfo objectForKey:kCTXNSPropertyDescriptionIsMandatoryInDTO_key];
    if (value != nil) {
        return stringContainsPositiveResponse(value);
    }
    return NO;
}

@end

@implementation NSRelationshipDescription (CTX)

- (BOOL)CTX_shouldBeDeletedWhenUnset
{
    NSString *value = [self.userInfo objectForKey:kCTXNSRelationshipDescriptionShouldNotBeDeletedWhenUnset_key];
    if (value != nil) {
        // Method checks for the negative value of User Info's property, because it is intended to be set,
        // when user doesn't want property to be deleted when unset.
        return stringContainsNegativeResponse(value);
    }
    return YES;
}

- (BOOL)CTX_shouldBeRepopulatedFromDTOWhenSet
{
    NSString *value = [self.userInfo objectForKey:kCTXNSRelationshipDescriptionShouldBeRepopulatedFromDTOWhenSet_key];
    if (value != nil) {
        return stringContainsPositiveResponse(value);
    }
    return NO;
}

@end
