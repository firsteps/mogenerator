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


////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////
static inline BOOL stringContainsNegativeResponse(NSString *string)
{
    NSString *normalizedString = [[string lowercaseString] stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
    return ([normalizedString isEqualToString:@"no"] ||
            [normalizedString isEqualToString:@"false"]);
}

////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////
// String which doesn't contain negative response is considered as containing a positive one.
static inline BOOL stringContainsPositiveResponse(NSString *string)
{
    return (!stringContainsNegativeResponse(string));
}

////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////
static NSString *dtoClassNameForManagedObjectClassName(NSString *managedObjectClassName)
{
    static NSString * const kMOSuffix = @"MO";
    static NSString * const kDTOSuffix = @"DTO";
    
    NSString *normalizedManagedObjectClassName = managedObjectClassName;
    BOOL managedObjectClassNameEndsWithMO = [managedObjectClassName hasSuffix:kMOSuffix];
    if (managedObjectClassNameEndsWithMO) {
        NSRange suffixRange = [normalizedManagedObjectClassName rangeOfString:kMOSuffix options:NSBackwardsSearch];
        normalizedManagedObjectClassName = [normalizedManagedObjectClassName stringByReplacingCharactersInRange:suffixRange withString:@""];
    }
    return [NSString stringWithFormat:@"%@%@", normalizedManagedObjectClassName, kDTOSuffix];
}

////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////
@implementation NSEntityDescription (CTX)

- (NSString *)CTX_dtoClassName
{
    NSString *value = [self.userInfo objectForKey:kCTXNSPropertyDescriptionDTOClassName_key];
    if (value == nil) {
        value = dtoClassNameForManagedObjectClassName([self managedObjectClassName]);
    }
    return value;
}

- (NSString *)CTX_dtoSuperclassName {
    NSEntityDescription *superentity = [self superentity];
    NSString *managedObjectClassName = ([[superentity managedObjectClassName] length] > 0) ? [superentity managedObjectClassName] : NSStringFromClass([NSManagedObject class]);
    BOOL superentityIsCustom = (superentity && ([managedObjectClassName isEqualToString:NSStringFromClass([NSManagedObject class])] == NO));
    if (superentityIsCustom) {
//        return dtoClassNameForManagedObjectClassName([self customSuperentity]);
        return [superentity CTX_dtoClassName];
    }
    return @"NSObject";
}

@end

////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////
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

////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////
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
