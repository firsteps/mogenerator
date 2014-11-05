//
//  CTXAdditionsTests.m
//  CTXAdditionsTests
//
//  Created by Dmitry Makarenko on 27/12/2012.
//
//

#import "CTXAdditionsTests.h"

#import "mogenerator+CTX.h"

@implementation CTXAdditionsTests {
    NSManagedObjectModel *_model;
}

- (void)setUp
{
    [super setUp];
    
    // Set-up code here.
    
    NSURL *modelURL = [[NSBundle bundleForClass:[self class]] URLForResource:@"TestDataModel" withExtension:@"momd"];
    _model = [[NSManagedObjectModel alloc] initWithContentsOfURL:modelURL];
}

- (void)tearDown
{
    // Tear-down code here.
    
    [_model release];
    _model = nil;
    
    [super tearDown];
}

- (void)test_010_NSEntityDescription_dtoClassNameIsGeneratedCorrectly
{
    NSString *const kAssertMessage = @"DTO class name is incorrect";
    
    NSEntityDescription *entity = nil;
    
    entity = [[_model entitiesByName] objectForKey:@"TestObject"];
    XCTAssertEqualObjects(@"TestObjectDTO", [entity CTX_dtoClassName], @"%@", kAssertMessage);

    entity = [[_model entitiesByName] objectForKey:@"MOTestObject"];
    XCTAssertEqualObjects(@"MOTestObjectDTO", [entity CTX_dtoClassName], @"%@", kAssertMessage);

    entity = [[_model entitiesByName] objectForKey:@"TestMOObject"];
    XCTAssertEqualObjects(@"TestMOObjectDTO", [entity CTX_dtoClassName], @"%@", kAssertMessage);

    entity = [[_model entitiesByName] objectForKey:@"TestObjectMO"];
    XCTAssertEqualObjects(@"TestObjectDTO", [entity CTX_dtoClassName], @"%@", kAssertMessage);

    entity = [[_model entitiesByName] objectForKey:@"CustomTestObject"];
    XCTAssertEqualObjects(@"CustomDTOClass", [entity CTX_dtoClassName], @"%@", kAssertMessage);
}

- (void)test_012_NSEntityDescription_dtoSuperclassNameIsGeneratedCorrectly
{
    NSString *const kAssertMessage = @"DTO superclass name is incorrect";

    NSEntityDescription *entity = nil;
    
    entity = [[_model entitiesByName] objectForKey:@"TestObject"];
    XCTAssertEqualObjects(@"NSObject", [entity CTX_dtoSuperclassName], @"%@", kAssertMessage);
    
    entity = [[_model entitiesByName] objectForKey:@"MOTestObject"];
    XCTAssertEqualObjects(@"MOBaseObjectDTO", [entity CTX_dtoSuperclassName], @"%@", kAssertMessage);
    
    entity = [[_model entitiesByName] objectForKey:@"TestMOObject"];
    XCTAssertEqualObjects(@"BaseMOObjectDTO", [entity CTX_dtoSuperclassName], @"%@", kAssertMessage);
    
    entity = [[_model entitiesByName] objectForKey:@"TestObjectMO"];
    XCTAssertEqualObjects(@"NSObject", [entity CTX_dtoSuperclassName], @"%@", kAssertMessage);
    
    entity = [[_model entitiesByName] objectForKey:@"CustomTestObject"];
    XCTAssertEqualObjects(@"CustomBaseDTOClass", [entity CTX_dtoSuperclassName], @"%@", kAssertMessage);
}

- (void)test_014_NSEntityDescription_immutableEntityClassNameIsGeneratedCorrectly
{
    NSString *const kAssertMessage = @"Immutable Entity class name is incorrect";

    NSEntityDescription *entity = nil;
    
    entity = [[_model entitiesByName] objectForKey:@"TestObject"];
    XCTAssertEqualObjects(@"TestObjectImmutableEntity", [entity CTX_immutableEntityClassName], @"%@", kAssertMessage);
    
    entity = [[_model entitiesByName] objectForKey:@"MOTestObject"];
    XCTAssertEqualObjects(@"MOTestObjectImmutableEntity", [entity CTX_immutableEntityClassName], @"%@", kAssertMessage);
    
    entity = [[_model entitiesByName] objectForKey:@"TestMOObject"];
    XCTAssertEqualObjects(@"TestMOObjectImmutableEntity", [entity CTX_immutableEntityClassName], @"%@", kAssertMessage);
    
    entity = [[_model entitiesByName] objectForKey:@"TestObjectMO"];
    XCTAssertEqualObjects(@"TestObjectImmutableEntity", [entity CTX_immutableEntityClassName], @"%@", kAssertMessage);
    
    entity = [[_model entitiesByName] objectForKey:@"CustomTestObject"];
    XCTAssertEqualObjects(@"CustomImmutableEntityClass", [entity CTX_immutableEntityClassName], @"%@", kAssertMessage);
}

- (void)test_016_NSEntityDescription_immutableEntitySuperclassNameIsGeneratedCorrectly
{
    NSString *const kAssertMessage = @"Immutable Entity superclass name is incorrect";

    NSEntityDescription *entity = nil;
    
    entity = [[_model entitiesByName] objectForKey:@"TestObject"];
    XCTAssertEqualObjects(@"NSObject", [entity CTX_immutableEntitySuperclassName], @"%@", kAssertMessage);
    
    entity = [[_model entitiesByName] objectForKey:@"MOTestObject"];
    XCTAssertEqualObjects(@"MOBaseObjectImmutableEntity", [entity CTX_immutableEntitySuperclassName], @"%@", kAssertMessage);
    
    entity = [[_model entitiesByName] objectForKey:@"TestMOObject"];
    XCTAssertEqualObjects(@"BaseMOObjectImmutableEntity", [entity CTX_immutableEntitySuperclassName], @"%@", kAssertMessage);
    
    entity = [[_model entitiesByName] objectForKey:@"TestObjectMO"];
    XCTAssertEqualObjects(@"NSObject", [entity CTX_immutableEntitySuperclassName], @"%@", kAssertMessage);
    
    entity = [[_model entitiesByName] objectForKey:@"CustomTestObject"];
    XCTAssertEqualObjects(@"CustomBaseImmutableEntityClass", [entity CTX_immutableEntitySuperclassName], @"%@", kAssertMessage);
}

- (void)test_018_NSEntityDescription_mutableEntityClassNameIsGeneratedCorrectly
{
    NSString *const kAssertMessage = @"Mutable Entity class name is incorrect";

    NSEntityDescription *entity = nil;

    entity = [[_model entitiesByName] objectForKey:@"TestObject"];
    XCTAssertEqualObjects(@"TestObjectMutableEntity", [entity CTX_mutableEntityClassName], @"%@", kAssertMessage);

    entity = [[_model entitiesByName] objectForKey:@"MOTestObject"];
    XCTAssertEqualObjects(@"MOTestObjectMutableEntity", [entity CTX_mutableEntityClassName], @"%@", kAssertMessage);

    entity = [[_model entitiesByName] objectForKey:@"TestMOObject"];
    XCTAssertEqualObjects(@"TestMOObjectMutableEntity", [entity CTX_mutableEntityClassName], @"%@", kAssertMessage);

    entity = [[_model entitiesByName] objectForKey:@"TestObjectMO"];
    XCTAssertEqualObjects(@"TestObjectMutableEntity", [entity CTX_mutableEntityClassName], @"%@", kAssertMessage);

    entity = [[_model entitiesByName] objectForKey:@"CustomTestObject"];
    XCTAssertEqualObjects(@"CustomMutableEntityClass", [entity CTX_mutableEntityClassName], @"%@", kAssertMessage);
}

- (void)test_020_NSEntityDescription_mutableEntitySuperclassNameIsGeneratedCorrectly
{
    NSString *const kAssertMessage = @"Mutable Entity superclass name is incorrect";

    NSEntityDescription *entity = nil;

    entity = [[_model entitiesByName] objectForKey:@"TestObject"];
    XCTAssertEqualObjects(@"NSObject", [entity CTX_mutableEntitySuperclassName], @"%@", kAssertMessage);

    entity = [[_model entitiesByName] objectForKey:@"MOTestObject"];
    XCTAssertEqualObjects(@"MOBaseObjectMutableEntity", [entity CTX_mutableEntitySuperclassName], @"%@", kAssertMessage);

    entity = [[_model entitiesByName] objectForKey:@"TestMOObject"];
    XCTAssertEqualObjects(@"BaseMOObjectMutableEntity", [entity CTX_mutableEntitySuperclassName], @"%@", kAssertMessage);

    entity = [[_model entitiesByName] objectForKey:@"TestObjectMO"];
    XCTAssertEqualObjects(@"NSObject", [entity CTX_mutableEntitySuperclassName], @"%@", kAssertMessage);

    entity = [[_model entitiesByName] objectForKey:@"CustomTestObject"];
    XCTAssertEqualObjects(@"CustomBaseMutableEntityClass", [entity CTX_mutableEntitySuperclassName], @"%@", kAssertMessage);
}

- (void)test_030_NSPropertyDescription_shouldBePersistedInDTO
{
    NSString *const kAssertMessage = @"[NSPropertyDescription CTX_shouldBePersistedInDTO] is broken";
    
    NSPropertyDescription *property = [[NSPropertyDescription alloc] init];

    XCTAssertTrue([property CTX_shouldBePersistedInDTO], @"%@", kAssertMessage);

    [property setUserInfo:@{@"com.ef.ctx.mogenerator.dto.shouldNotBePersisted" : @"NO"}];
    XCTAssertTrue([property CTX_shouldBePersistedInDTO], @"%@", kAssertMessage);
    
    [property setUserInfo:@{@"com.ef.ctx.mogenerator.dto.shouldNotBePersisted" : @"no"}];
    XCTAssertTrue([property CTX_shouldBePersistedInDTO], @"%@", kAssertMessage);
    
    [property setUserInfo:@{@"com.ef.ctx.mogenerator.dto.shouldNotBePersisted" : @"false"}];
    XCTAssertTrue([property CTX_shouldBePersistedInDTO], @"%@", kAssertMessage);
    
    [property setUserInfo:@{@"com.ef.ctx.mogenerator.dto.shouldNotBePersisted" : @"FALSE"}];
    XCTAssertTrue([property CTX_shouldBePersistedInDTO], @"%@", kAssertMessage);
    
    [property setUserInfo:@{@"com.ef.ctx.mogenerator.dto.shouldNotBePersisted" : @" FaLSe    "}];
    XCTAssertTrue([property CTX_shouldBePersistedInDTO], @"%@", kAssertMessage);

    [property setUserInfo:@{@"com.ef.ctx.mogenerator.dto.shouldNotBePersisted" : @""}];
    XCTAssertFalse([property CTX_shouldBePersistedInDTO], @"%@", kAssertMessage);

    [property setUserInfo:@{@"com.ef.ctx.mogenerator.dto.shouldNotBePersisted" : @"YES"}];
    XCTAssertFalse([property CTX_shouldBePersistedInDTO], @"%@", kAssertMessage);
    
    [property setUserInfo:@{@"com.ef.ctx.mogenerator.dto.shouldNotBePersisted" : @"NO false"}];
    XCTAssertFalse([property CTX_shouldBePersistedInDTO], @"%@", kAssertMessage);

    [property setUserInfo:@{@"com.ef.ctx.mogenerator.dto.shouldNotBePersisted" : @"Just any string here bla-bla"}];
    XCTAssertFalse([property CTX_shouldBePersistedInDTO], @"%@", kAssertMessage);
}

- (void)test_040_NSPropertyDescription_isMandatoryInDTO
{    
    NSString *const kAssertMessage = @"[NSPropertyDescription CTX_isMandatoryInDTO] is broken";
    
    NSPropertyDescription *property = [[NSPropertyDescription alloc] init];

    XCTAssertFalse([property CTX_isMandatoryInDTO], @"%@", kAssertMessage);
    
    [property setUserInfo:@{@"com.ef.ctx.mogenerator.dto.mandatory" : @"NO"}];
    XCTAssertFalse([property CTX_isMandatoryInDTO], @"%@", kAssertMessage);
    
    [property setUserInfo:@{@"com.ef.ctx.mogenerator.dto.mandatory" : @"no"}];
    XCTAssertFalse([property CTX_isMandatoryInDTO], @"%@", kAssertMessage);
    
    [property setUserInfo:@{@"com.ef.ctx.mogenerator.dto.mandatory" : @"false"}];
    XCTAssertFalse([property CTX_isMandatoryInDTO], @"%@", kAssertMessage);
    
    [property setUserInfo:@{@"com.ef.ctx.mogenerator.dto.mandatory" : @"FALSE"}];
    XCTAssertFalse([property CTX_isMandatoryInDTO], @"%@", kAssertMessage);
    
    [property setUserInfo:@{@"com.ef.ctx.mogenerator.dto.mandatory" : @"  fALSe  "}];
    XCTAssertFalse([property CTX_isMandatoryInDTO], @"%@", kAssertMessage);

    [property setUserInfo:@{@"com.ef.ctx.mogenerator.dto.mandatory" : @""}];
    XCTAssertTrue([property CTX_isMandatoryInDTO], @"%@", kAssertMessage);
    
    [property setUserInfo:@{@"com.ef.ctx.mogenerator.dto.mandatory" : @"YES"}];
    XCTAssertTrue([property CTX_isMandatoryInDTO], @"%@", kAssertMessage);
    
    [property setUserInfo:@{@"com.ef.ctx.mogenerator.dto.mandatory" : @"No FalSe"}];
    XCTAssertTrue([property CTX_isMandatoryInDTO], @"%@", kAssertMessage);
    
    [property setUserInfo:@{@"com.ef.ctx.mogenerator.dto.mandatory" : @"Just any STRING..."}];
    XCTAssertTrue([property CTX_isMandatoryInDTO], @"%@", kAssertMessage);
}

- (void)test_050_NSRelationshipDescription_shouldBeDeletedWhenUnset
{
    NSString *const kAssertMessage = @"[NSRelationshipDescription CTX_shouldBeDeletedWhenUnset] is broken";
    
    NSRelationshipDescription *relationship = [[NSRelationshipDescription alloc] init];
    
    XCTAssertTrue([relationship CTX_shouldBeDeletedWhenUnset], @"%@", kAssertMessage);

    [relationship setUserInfo:@{@"com.ef.ctx.mogenerator.mo.shouldNotBeDeletedWhenUnset" : @"NO"}];
    XCTAssertTrue([relationship CTX_shouldBeDeletedWhenUnset], @"%@", kAssertMessage);
    
    [relationship setUserInfo:@{@"com.ef.ctx.mogenerator.mo.shouldNotBeDeletedWhenUnset" : @"no"}];
    XCTAssertTrue([relationship CTX_shouldBeDeletedWhenUnset], @"%@", kAssertMessage);
    
    [relationship setUserInfo:@{@"com.ef.ctx.mogenerator.mo.shouldNotBeDeletedWhenUnset" : @"FALSE"}];
    XCTAssertTrue([relationship CTX_shouldBeDeletedWhenUnset], @"%@", kAssertMessage);
    
    [relationship setUserInfo:@{@"com.ef.ctx.mogenerator.mo.shouldNotBeDeletedWhenUnset" : @"false"}];
    XCTAssertTrue([relationship CTX_shouldBeDeletedWhenUnset], @"%@", kAssertMessage);
    
    [relationship setUserInfo:@{@"com.ef.ctx.mogenerator.mo.shouldNotBeDeletedWhenUnset" : @"  FAlSe        "}];
    XCTAssertTrue([relationship CTX_shouldBeDeletedWhenUnset], @"%@", kAssertMessage);
    
    [relationship setUserInfo:@{@"com.ef.ctx.mogenerator.mo.shouldNotBeDeletedWhenUnset" : @""}];
    XCTAssertFalse([relationship CTX_shouldBeDeletedWhenUnset], @"%@", kAssertMessage);
    
    [relationship setUserInfo:@{@"com.ef.ctx.mogenerator.mo.shouldNotBeDeletedWhenUnset" : @"YES"}];
    XCTAssertFalse([relationship CTX_shouldBeDeletedWhenUnset], @"%@", kAssertMessage);
    
    [relationship setUserInfo:@{@"com.ef.ctx.mogenerator.mo.shouldNotBeDeletedWhenUnset" : @"NO FALSE"}];
    XCTAssertFalse([relationship CTX_shouldBeDeletedWhenUnset], @"%@", kAssertMessage);
    
    [relationship setUserInfo:@{@"com.ef.ctx.mogenerator.mo.shouldNotBeDeletedWhenUnset" : @"Just any string. Any!!!!1!!111"}];
    XCTAssertFalse([relationship CTX_shouldBeDeletedWhenUnset], @"%@", kAssertMessage);
}

- (void)test_060_NSRelationshipDescription_shouldBeRepopulatedFromDTOWhenSet
{
    NSString *const kAssertMessage = @"[NSRelationshipDescription CTX_shouldBeRepopulatedFromDTOWhenSet] is broken";

    NSRelationshipDescription *relationship = [[NSRelationshipDescription alloc] init];
    
    XCTAssertFalse([relationship CTX_shouldBeRepopulatedFromDTOWhenSet], @"%@", kAssertMessage);
    
    [relationship setUserInfo:@{@"com.ef.ctx.mogenerator.mo.shouldBeRepopulatedFromDTOWhenSet" : @"NO"}];
    XCTAssertFalse([relationship CTX_shouldBeRepopulatedFromDTOWhenSet], @"%@", kAssertMessage);
    
    [relationship setUserInfo:@{@"com.ef.ctx.mogenerator.mo.shouldBeRepopulatedFromDTOWhenSet" : @"no"}];
    XCTAssertFalse([relationship CTX_shouldBeRepopulatedFromDTOWhenSet], @"%@", kAssertMessage);
    
    [relationship setUserInfo:@{@"com.ef.ctx.mogenerator.mo.shouldBeRepopulatedFromDTOWhenSet" : @"FALSE"}];
    XCTAssertFalse([relationship CTX_shouldBeRepopulatedFromDTOWhenSet], @"%@", kAssertMessage);
    
    [relationship setUserInfo:@{@"com.ef.ctx.mogenerator.mo.shouldBeRepopulatedFromDTOWhenSet" : @"false"}];
    XCTAssertFalse([relationship CTX_shouldBeRepopulatedFromDTOWhenSet], @"%@", kAssertMessage);
    
    [relationship setUserInfo:@{@"com.ef.ctx.mogenerator.mo.shouldBeRepopulatedFromDTOWhenSet" : @"  FAlSe        "}];
    XCTAssertFalse([relationship CTX_shouldBeRepopulatedFromDTOWhenSet], @"%@", kAssertMessage);
    
    [relationship setUserInfo:@{@"com.ef.ctx.mogenerator.mo.shouldBeRepopulatedFromDTOWhenSet" : @""}];
    XCTAssertTrue([relationship CTX_shouldBeRepopulatedFromDTOWhenSet], @"%@", kAssertMessage);
    
    [relationship setUserInfo:@{@"com.ef.ctx.mogenerator.mo.shouldBeRepopulatedFromDTOWhenSet" : @"YES"}];
    XCTAssertTrue([relationship CTX_shouldBeRepopulatedFromDTOWhenSet], @"%@", kAssertMessage);
    
    [relationship setUserInfo:@{@"com.ef.ctx.mogenerator.mo.shouldBeRepopulatedFromDTOWhenSet" : @"NO FALSE"}];
    XCTAssertTrue([relationship CTX_shouldBeRepopulatedFromDTOWhenSet], @"%@", kAssertMessage);
    
    [relationship setUserInfo:@{@"com.ef.ctx.mogenerator.mo.shouldBeRepopulatedFromDTOWhenSet" : @"Just any string. Any!!!!1!!111"}];
    XCTAssertTrue([relationship CTX_shouldBeRepopulatedFromDTOWhenSet], @"%@", kAssertMessage);
}

- (void)test_070_NSEntityDescription_attributesPersistingInDTO
{
    NSEntityDescription *entity = nil;

    entity = [[_model entitiesByName] objectForKey:@"Parent"];

    XCTAssertTrue([[entity CTX_noninheritedAttributesPersistingInDTO] count] == 0, @"A wrong number of attributes which are being persisted in DTO");
    XCTAssertFalse([entity CTX_hasNoninheritedAttributesPersistingInDTO], @"Entity has no attributes which are being persisted in DTO");
    
    entity = [[_model entitiesByName] objectForKey:@"SubParent"];

    XCTAssertTrue([[entity CTX_noninheritedAttributesPersistingInDTO] count] == 1, @"A wrong number of attributes which are being persisted in DTO");
    XCTAssertTrue([entity CTX_hasNoninheritedAttributesPersistingInDTO], @"Entity has attributes which are being persisted in DTO");
    
    entity = [[_model entitiesByName] objectForKey:@"SubParentEmpty"];

    XCTAssertTrue([[entity CTX_noninheritedAttributesPersistingInDTO] count] == 0, @"A wrong number of attributes which are being persisted in DTO");
    XCTAssertFalse([entity CTX_hasNoninheritedAttributesPersistingInDTO], @"Entity has no attributes which are being persisted in DTO");
}

- (void)test_072_NSEntityDescription_relationshipsPersistingInDTO
{
    NSEntityDescription *entity = nil;

    entity = [[_model entitiesByName] objectForKey:@"Parent"];

    XCTAssertTrue([[entity CTX_noninheritedRelationshipsPersistingInDTO] count] == 2, @"A wrong number of relationships which are being persisted in DTO");
    XCTAssertTrue([entity CTX_hasNoninheritedRelationshipsPersistingInDTO], @"Entity has no relationships which are being persisted in DTO");

    entity = [[_model entitiesByName] objectForKey:@"SubParent"];

    XCTAssertTrue([[entity CTX_noninheritedRelationshipsPersistingInDTO] count] == 1, @"A wrong number of relationships which are being persisted in DTO");
    XCTAssertTrue([entity CTX_hasNoninheritedRelationshipsPersistingInDTO], @"Entity has relationships which are being persisted in DTO");

    entity = [[_model entitiesByName] objectForKey:@"SubParentEmpty"];

    XCTAssertTrue([[entity CTX_noninheritedRelationshipsPersistingInDTO] count] == 0, @"A wrong number of relationships which are being persisted in DTO");
    XCTAssertFalse([entity CTX_hasNoninheritedRelationshipsPersistingInDTO], @"Entity has no relationships which are being persisted in DTO");
}

@end
