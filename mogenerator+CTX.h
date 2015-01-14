//
//  mogenerator+CTX.h
//  mogenerator
//
//  Created by Dmitry Makarenko on 21/12/2012.
//
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>


////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////
@interface NSEntityDescription (CTX)

- (NSString *)CTX_dtoClassName;
- (NSString *)CTX_dtoSuperclassName;
- (NSString *)CTX_immutableEntityClassName;
- (NSString *)CTX_immutableEntitySuperclassName;
- (NSString *)CTX_mutableEntityClassName;
- (NSString *)CTX_mutableEntitySuperclassName;

- (BOOL)CTX_hasNoninheritedAttributes;
- (BOOL)CTX_hasNoninheritedAttributesSansType;
- (BOOL)CTX_hasNoninheritedRelationships;
- (BOOL)CTX_hasNoninheritedFetchedProperties;

- (NSArray *)CTX_noninheritedAttributesPersistingInDTO;
- (NSArray *)CTX_noninheritedRelationshipsPersistingInDTO;

- (BOOL)CTX_hasNoninheritedAttributesPersistingInDTO;
- (BOOL)CTX_hasNoninheritedRelationshipsPersistingInDTO;

- (NSArray *)CTX_noninheritedExposedAttributes;
- (NSArray *)CTX_noninheritedExposedRelationships;

- (BOOL)CTX_hasNoninheritedExposedAttributes;
- (BOOL)CTX_hasNoninheritedExposedRelationships;

- (BOOL)CTX_isCore;
- (NSString *)CTX_coreEntityTypeClassName;

- (BOOL)CTX_hasSubentities;

- (NSArray *)CTX_finalSubentities;

- (NSArray *)CTX_noninheritedIdentifierAttributes;
- (BOOL)CTX_hasNoninheritedIdentifierProperties;

@end

////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////
@interface NSPropertyDescription (CTX)

// Marks attributes/relationships to be exposed in DTOs and Entities (default value is YES)
//
// Corresponds the 'com.ef.ctx.mogenerator.property.shouldNotBeExposed' property of User Info dictionary

- (BOOL)CTX_shouldBeExposed;

// Marks attributes/relationships to be persisted in DTOs (default value is YES)
//
// Corresponds the 'CTX_shouldBeExposed

- (BOOL)CTX_shouldBePersistedInDTO;

// Marks properties to be mandatory in DTO (default value is NO)
// It means that the value of property in DTO cannot be nil. Otherwise an old value of the same property in MO will be preserved during 'populateFromDTO' call.
// Also in 'createDTO' method additional checks will be added
//
// Corresponds to the 'com.ef.ctx.mogenerator.dto.mandatory' property of User Info dictionary

- (BOOL)CTX_isMandatoryInDTO;

// Marks attributes/relationships to be readonly in both Immutable & Mutable Entities (default value is NO)

- (BOOL)CTX_isReadonlyInEntity;

@end

////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////
@interface NSAttributeDescription (CTX)

// Marks attributes/relationships as a part of a composite Entity's identifier (used in isEqual:)

- (BOOL)CTX_isIdentifierInEntity;

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
