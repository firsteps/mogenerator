//
//  mogenerator+CTX.h
//  mogenerator
//
//  Created by Dmitry Makarenko on 21/12/2012.
//
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>


extern NSString * const kCTXNSPropertyDescriptionShouldNotBePersistedInDTO_key;
extern NSString * const kCTXNSPropertyDescriptionIsMandatoryInDTO_key;
extern NSString * const kCTXNSRelationshipDescriptionShouldNotBeDeletedWhenUnset_key;
extern NSString * const kCTXNSRelationshipDescriptionShouldBeRepopulatedFromDTOWhenSet_key;

extern NSString * const kCTXNSPropertyDescriptionDTOClassName_key;
extern NSString * const kCTXNSPropertyDescriptionRepositoryClassName_key;


////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////
@interface NSEntityDescription (CTX)

- (NSString *)CTX_dtoClassName;

- (NSString *)CTX_dtoSuperclassName;

- (NSString *)CTX_repositoryClassName;

@end

////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////
@interface NSPropertyDescription (CTX)

// Marks attributes/relationships to be persisted in DTOs (default value is YES)
//
// Corresponds the 'com.ef.ctx.mogenerator.dto.shouldNotBePersisted' property of User Info dictionary

- (BOOL)CTX_shouldBePersistedInDTO;

// Marks properties to be mandatory in DTO (default value is NO)
// It means that the value of property in DTO cannot be nil. Otherwise an old value of the same property in MO will be preserved during 'populateFromDTO' call.
// Also in 'createDTO' method additional checks will be added
//
// Corresponds to the 'com.ef.ctx.mogenerator.dto.mandatory' property of User Info dictionary

- (BOOL)CTX_isMandatoryInDTO;

@end

////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////
@interface NSAttributeDescription (CTX)

// No additions so far

@end

////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////
@interface NSRelationshipDescription (CTX)

// Makes relationship objects to be kept in DB when MO object is populated from DTO and the value of relationship object is set (default YES).
// As for to-many relationships new MO objects are always created and populated from DTOs.
// That qualifier makes sense for to-many relationships mostly.
//
// Corresponds to the 'com.ef.ctx.mogenerator.mo.shouldNotBeDeletedWhenUnset' property of User Info dictionary.

- (BOOL)CTX_shouldBeDeletedWhenUnset;

// Marks one-to-one relationship objects to be kept in DB and populated from corresponding DTOs.
// When MO object is populated from DTO and the value of relationship object is set (default NO).
// Otherwise, the existing relationship object will be deleted and the new one will be created and populated from DTO.
//
// Corresponds to the 'com.ef.ctx.mogenerator.mo.shouldBeRepopulatedFromDTOWhenSet' property of User Info dictionary.

- (BOOL)CTX_shouldBeRepopulatedFromDTOWhenSet;

@end
