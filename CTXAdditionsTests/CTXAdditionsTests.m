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
    
    _model = nil;
    
    [super tearDown];
}

- (void)test_NSEntityDescription_dtoClassNameIsGeneratedCorrectly
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

- (void)test_NSEntityDescription_dtoSuperclassNameIsGeneratedCorrectly
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

- (void)test_NSEntityDescription_immutableEntityClassNameIsGeneratedCorrectly
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

- (void)test_NSEntityDescription_immutableEntitySuperclassNameIsGeneratedCorrectly
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

- (void)test_NSEntityDescription_mutableEntityClassNameIsGeneratedCorrectly
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

- (void)test_NSEntityDescription_mutableEntitySuperclassNameIsGeneratedCorrectly
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

- (void)test_NSPropertyDescription_shouldBeExposedAndPersistedInDTO
{
    NSString *const userInfokey = @"com.ef.ctx.mogenerator.property.shouldNotBeExposed";
    
    NSString *const kAssertMessage = @"[NSPropertyDescription CTX_shouldBeExposed] & [NSPropertyDescription CTX_shouldBePersistedInDTO] are broken";
    
    NSPropertyDescription *property = [[NSPropertyDescription alloc] init];
    XCTAssertTrue([property CTX_shouldBeExposed], @"%@", kAssertMessage);
    XCTAssertTrue([property CTX_shouldBePersistedInDTO], @"%@", kAssertMessage);

    property = [[NSPropertyDescription alloc] init];
    [property setUserInfo:@{userInfokey : @"NO"}];
    XCTAssertTrue([property CTX_shouldBeExposed], @"%@", kAssertMessage);
    XCTAssertTrue([property CTX_shouldBePersistedInDTO], @"%@", kAssertMessage);
    
    property = [[NSPropertyDescription alloc] init];
    [property setUserInfo:@{userInfokey : @"no"}];
    XCTAssertTrue([property CTX_shouldBeExposed], @"%@", kAssertMessage);
    XCTAssertTrue([property CTX_shouldBePersistedInDTO], @"%@", kAssertMessage);
    
    property = [[NSPropertyDescription alloc] init];
    [property setUserInfo:@{userInfokey : @"false"}];
    XCTAssertTrue([property CTX_shouldBeExposed], @"%@", kAssertMessage);
    XCTAssertTrue([property CTX_shouldBePersistedInDTO], @"%@", kAssertMessage);
    
    property = [[NSPropertyDescription alloc] init];
    [property setUserInfo:@{userInfokey : @"FALSE"}];
    XCTAssertTrue([property CTX_shouldBeExposed], @"%@", kAssertMessage);
    XCTAssertTrue([property CTX_shouldBePersistedInDTO], @"%@", kAssertMessage);
    
    property = [[NSPropertyDescription alloc] init];
    [property setUserInfo:@{userInfokey : @" FaLSe    "}];
    XCTAssertTrue([property CTX_shouldBeExposed], @"%@", kAssertMessage);
    XCTAssertTrue([property CTX_shouldBePersistedInDTO], @"%@", kAssertMessage);

    property = [[NSPropertyDescription alloc] init];
    [property setUserInfo:@{userInfokey : @""}];
    XCTAssertFalse([property CTX_shouldBeExposed], @"%@", kAssertMessage);
    XCTAssertFalse([property CTX_shouldBePersistedInDTO], @"%@", kAssertMessage);

    property = [[NSPropertyDescription alloc] init];
    [property setUserInfo:@{userInfokey : @"YES"}];
    XCTAssertFalse([property CTX_shouldBeExposed], @"%@", kAssertMessage);
    XCTAssertFalse([property CTX_shouldBePersistedInDTO], @"%@", kAssertMessage);
    
    property = [[NSPropertyDescription alloc] init];
    [property setUserInfo:@{userInfokey : @"NO false"}];
    XCTAssertFalse([property CTX_shouldBeExposed], @"%@", kAssertMessage);
    XCTAssertFalse([property CTX_shouldBePersistedInDTO], @"%@", kAssertMessage);

    property = [[NSPropertyDescription alloc] init];
    [property setUserInfo:@{userInfokey : @"Just any string here bla-bla"}];
    XCTAssertFalse([property CTX_shouldBeExposed], @"%@", kAssertMessage);
    XCTAssertFalse([property CTX_shouldBePersistedInDTO], @"%@", kAssertMessage);
}

- (void)test_NSPropertyDescription_isMandatoryInDTO
{    
    NSString *const userInfoKey = @"com.ef.ctx.mogenerator.dto.property.mandatory";

    NSString *const kAssertMessage = @"[NSPropertyDescription CTX_isMandatoryInDTO] is broken";
    
    NSPropertyDescription *property = [[NSPropertyDescription alloc] init];
    XCTAssertFalse([property CTX_isMandatoryInDTO], @"%@", kAssertMessage);
    
    property = [[NSPropertyDescription alloc] init];
    [property setUserInfo:@{userInfoKey : @"NO"}];
    XCTAssertFalse([property CTX_isMandatoryInDTO], @"%@", kAssertMessage);
    
    property = [[NSPropertyDescription alloc] init];
    [property setUserInfo:@{userInfoKey : @"no"}];
    XCTAssertFalse([property CTX_isMandatoryInDTO], @"%@", kAssertMessage);
    
    property = [[NSPropertyDescription alloc] init];
    [property setUserInfo:@{userInfoKey : @"false"}];
    XCTAssertFalse([property CTX_isMandatoryInDTO], @"%@", kAssertMessage);
    
    property = [[NSPropertyDescription alloc] init];
    [property setUserInfo:@{userInfoKey : @"FALSE"}];
    XCTAssertFalse([property CTX_isMandatoryInDTO], @"%@", kAssertMessage);
    
    property = [[NSPropertyDescription alloc] init];
    [property setUserInfo:@{userInfoKey : @"  fALSe  "}];
    XCTAssertFalse([property CTX_isMandatoryInDTO], @"%@", kAssertMessage);

    property = [[NSPropertyDescription alloc] init];
    [property setUserInfo:@{userInfoKey : @""}];
    XCTAssertTrue([property CTX_isMandatoryInDTO], @"%@", kAssertMessage);
    
    property = [[NSPropertyDescription alloc] init];
    [property setUserInfo:@{userInfoKey : @"YES"}];
    XCTAssertTrue([property CTX_isMandatoryInDTO], @"%@", kAssertMessage);
    
    property = [[NSPropertyDescription alloc] init];
    [property setUserInfo:@{userInfoKey : @"No FalSe"}];
    XCTAssertTrue([property CTX_isMandatoryInDTO], @"%@", kAssertMessage);
    
    property = [[NSPropertyDescription alloc] init];
    [property setUserInfo:@{userInfoKey : @"Just any STRING..."}];
    XCTAssertTrue([property CTX_isMandatoryInDTO], @"%@", kAssertMessage);
}

- (void)test_NSRelationshipDescription_shouldBeDeletedWhenUnset
{
    NSString *const userInfoKey = @"com.ef.ctx.mogenerator.mo.relationship.shouldNotBeDeletedWhenUnset";
    
    NSString *const kAssertMessage = @"[NSRelationshipDescription CTX_shouldBeDeletedWhenUnset] is broken";
    
    NSRelationshipDescription *relationship = [[NSRelationshipDescription alloc] init];
    XCTAssertTrue([relationship CTX_shouldBeDeletedWhenUnset], @"%@", kAssertMessage);

    relationship = [[NSRelationshipDescription alloc] init];
    [relationship setUserInfo:@{userInfoKey : @"NO"}];
    XCTAssertTrue([relationship CTX_shouldBeDeletedWhenUnset], @"%@", kAssertMessage);
    
    relationship = [[NSRelationshipDescription alloc] init];
    [relationship setUserInfo:@{userInfoKey : @"no"}];
    XCTAssertTrue([relationship CTX_shouldBeDeletedWhenUnset], @"%@", kAssertMessage);
    
    relationship = [[NSRelationshipDescription alloc] init];
    [relationship setUserInfo:@{userInfoKey : @"FALSE"}];
    XCTAssertTrue([relationship CTX_shouldBeDeletedWhenUnset], @"%@", kAssertMessage);
    
    relationship = [[NSRelationshipDescription alloc] init];
    [relationship setUserInfo:@{userInfoKey : @"false"}];
    XCTAssertTrue([relationship CTX_shouldBeDeletedWhenUnset], @"%@", kAssertMessage);
    
    relationship = [[NSRelationshipDescription alloc] init];
    [relationship setUserInfo:@{userInfoKey : @"  FAlSe        "}];
    XCTAssertTrue([relationship CTX_shouldBeDeletedWhenUnset], @"%@", kAssertMessage);
    
    relationship = [[NSRelationshipDescription alloc] init];
    [relationship setUserInfo:@{userInfoKey : @""}];
    XCTAssertFalse([relationship CTX_shouldBeDeletedWhenUnset], @"%@", kAssertMessage);
    
    relationship = [[NSRelationshipDescription alloc] init];
    [relationship setUserInfo:@{userInfoKey : @"YES"}];
    XCTAssertFalse([relationship CTX_shouldBeDeletedWhenUnset], @"%@", kAssertMessage);
    
    relationship = [[NSRelationshipDescription alloc] init];
    [relationship setUserInfo:@{userInfoKey : @"NO FALSE"}];
    XCTAssertFalse([relationship CTX_shouldBeDeletedWhenUnset], @"%@", kAssertMessage);
    
    relationship = [[NSRelationshipDescription alloc] init];
    [relationship setUserInfo:@{userInfoKey : @"Just any string. Any!!!!1!!111"}];
    XCTAssertFalse([relationship CTX_shouldBeDeletedWhenUnset], @"%@", kAssertMessage);
}

- (void)test_NSRelationshipDescription_shouldBeRepopulatedFromDTOWhenSet
{
    NSString *const userInfoKey = @"com.ef.ctx.mogenerator.mo.relationship.shouldBeRepopulatedFromDTOWhenSet";
    
    NSString *const kAssertMessage = @"[NSRelationshipDescription CTX_shouldBeRepopulatedFromDTOWhenSet] is broken";

    NSRelationshipDescription *relationship = [[NSRelationshipDescription alloc] init];
    XCTAssertFalse([relationship CTX_shouldBeRepopulatedFromDTOWhenSet], @"%@", kAssertMessage);
    
    relationship = [[NSRelationshipDescription alloc] init];
    [relationship setUserInfo:@{userInfoKey : @"NO"}];
    XCTAssertFalse([relationship CTX_shouldBeRepopulatedFromDTOWhenSet], @"%@", kAssertMessage);
    
    relationship = [[NSRelationshipDescription alloc] init];
    [relationship setUserInfo:@{userInfoKey : @"no"}];
    XCTAssertFalse([relationship CTX_shouldBeRepopulatedFromDTOWhenSet], @"%@", kAssertMessage);
    
    relationship = [[NSRelationshipDescription alloc] init];
    [relationship setUserInfo:@{userInfoKey : @"FALSE"}];
    XCTAssertFalse([relationship CTX_shouldBeRepopulatedFromDTOWhenSet], @"%@", kAssertMessage);
    
    relationship = [[NSRelationshipDescription alloc] init];
    [relationship setUserInfo:@{userInfoKey : @"false"}];
    XCTAssertFalse([relationship CTX_shouldBeRepopulatedFromDTOWhenSet], @"%@", kAssertMessage);
    
    relationship = [[NSRelationshipDescription alloc] init];
    [relationship setUserInfo:@{userInfoKey : @"  FAlSe        "}];
    XCTAssertFalse([relationship CTX_shouldBeRepopulatedFromDTOWhenSet], @"%@", kAssertMessage);
    
    relationship = [[NSRelationshipDescription alloc] init];
    [relationship setUserInfo:@{userInfoKey : @""}];
    XCTAssertTrue([relationship CTX_shouldBeRepopulatedFromDTOWhenSet], @"%@", kAssertMessage);
    
    relationship = [[NSRelationshipDescription alloc] init];
    [relationship setUserInfo:@{userInfoKey : @"YES"}];
    XCTAssertTrue([relationship CTX_shouldBeRepopulatedFromDTOWhenSet], @"%@", kAssertMessage);
    
    relationship = [[NSRelationshipDescription alloc] init];
    [relationship setUserInfo:@{userInfoKey : @"NO FALSE"}];
    XCTAssertTrue([relationship CTX_shouldBeRepopulatedFromDTOWhenSet], @"%@", kAssertMessage);
    
    relationship = [[NSRelationshipDescription alloc] init];
    [relationship setUserInfo:@{userInfoKey : @"Just any string. Any!!!!1!!111"}];
    XCTAssertTrue([relationship CTX_shouldBeRepopulatedFromDTOWhenSet], @"%@", kAssertMessage);
}


- (void)test_NSEntityDescription_isUniquelyIdentifiable
{
    NSString *const kAssertMessage = @"[NSEntityDescription CTX_isUniquelyIdentifiable] is broken";
    
    NSString *entityName = @"VehicleAbstract";
    NSEntityDescription *entity = [[_model entitiesByName] objectForKey:entityName];
    XCTAssertFalse([entity CTX_isUniquelyIdentifiable], @"%@", kAssertMessage);
    XCTAssertFalse([entity CTX_hasNoninheritedIdentifierAttributes], @"%@", kAssertMessage);
    
    entityName = @"VehicleShip";
    entity = [[_model entitiesByName] objectForKey:entityName];
    XCTAssertFalse([entity CTX_isUniquelyIdentifiable], @"%@", kAssertMessage);
    XCTAssertFalse([entity CTX_hasNoninheritedIdentifierAttributes], @"%@", kAssertMessage);
    
    entityName = @"VehiclePlane";
    entity = [[_model entitiesByName] objectForKey:entityName];
    XCTAssertFalse([entity CTX_isUniquelyIdentifiable], @"%@", kAssertMessage);
    XCTAssertFalse([entity CTX_hasNoninheritedIdentifierAttributes], @"%@", kAssertMessage);
    
    entityName = @"VehicleCar";
    entity = [[_model entitiesByName] objectForKey:entityName];
    XCTAssertTrue([entity CTX_isUniquelyIdentifiable], @"%@", kAssertMessage);
    XCTAssertEqual([[entity CTX_noninheritedIdentifierAttributes] count], 1, @"%@", @"Entity should have a single Indentifier Attribute");
    XCTAssertEqualObjects([[[entity CTX_noninheritedIdentifierAttributes] objectAtIndex:0] name], @"uuid", @"%@", @"Entity should have an Indentifier Attribute: uuid");
    XCTAssertTrue([entity CTX_hasNoninheritedIdentifierAttributes], @"%@", kAssertMessage);

    entityName = @"VehicleCarSport";
    entity = [[_model entitiesByName] objectForKey:entityName];
    XCTAssertTrue([entity CTX_isUniquelyIdentifiable], @"%@", kAssertMessage);
    XCTAssertEqual([[entity CTX_noninheritedIdentifierAttributes] count], 0, @"%@", @"Entity should not have any Indentifier Attributes");
    XCTAssertFalse([entity CTX_hasNoninheritedIdentifierAttributes], @"%@", kAssertMessage);
    
    entityName = @"VehicleCarTruck";
    entity = [[_model entitiesByName] objectForKey:entityName];
    XCTAssertTrue([entity CTX_isUniquelyIdentifiable], @"%@", kAssertMessage);
    XCTAssertEqual([[entity CTX_noninheritedIdentifierAttributes] count], 0, @"%@", @"Entity should not have any Indentifier Attributes");
    XCTAssertFalse([entity CTX_hasNoninheritedIdentifierAttributes], @"%@", kAssertMessage);
}

- (void)test_NSEntityDescription_hasNoninheritedIdentifierProperties
{
    NSString *const kAssertMessage = @"[NSEntityDescription CTX_hasNoninheritedIdentifierAttributes] is broken";
    
    NSString *entityName = @"VehicleAbstract";
    NSEntityDescription *entity = [[_model entitiesByName] objectForKey:entityName];
    XCTAssertFalse([entity CTX_hasNoninheritedIdentifierAttributes], @"%@", kAssertMessage);
    
    entityName = @"VehicleShip";
    entity = [[_model entitiesByName] objectForKey:entityName];
    XCTAssertFalse([entity CTX_hasNoninheritedIdentifierAttributes], @"%@", kAssertMessage);
    
    entityName = @"VehiclePlane";
    entity = [[_model entitiesByName] objectForKey:entityName];
    XCTAssertFalse([entity CTX_hasNoninheritedIdentifierAttributes], @"%@", kAssertMessage);
    
    entityName = @"VehicleCar";
    entity = [[_model entitiesByName] objectForKey:entityName];
    XCTAssertTrue([entity CTX_hasNoninheritedIdentifierAttributes], @"%@", kAssertMessage);
    
    entityName = @"VehicleCarSport";
    entity = [[_model entitiesByName] objectForKey:entityName];
    XCTAssertFalse([entity CTX_hasNoninheritedIdentifierAttributes], @"%@", kAssertMessage);
    
    entityName = @"VehicleCarTruck";
    entity = [[_model entitiesByName] objectForKey:entityName];
    XCTAssertFalse([entity CTX_hasNoninheritedIdentifierAttributes], @"%@", kAssertMessage);
}

- (void)test_NSEntityDescription_attributesPersistingInDTO
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

- (void)test_NSEntityDescription_relationshipsPersistingInDTO
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

- (void)test_NSEntityDescription_finalSubentities
{
    NSString *entityName = @"VehicleAbstract";
    NSEntityDescription *entity = [[_model entitiesByName] objectForKey:entityName];
    
    XCTAssertTrue([entity CTX_hasSubentities], @"%@ has subentities", entityName);
    
    NSArray *finalSubentities = [entity CTX_finalSubentities];
    
    XCTAssertTrue([finalSubentities count] == 4, @"A wrong number of final Subentities");

    entityName = @"VehicleShip";
    entity = [[_model entitiesByName] objectForKey:entityName];
    XCTAssertFalse([entity CTX_hasSubentities], @"%@ has subentities", entityName);
    XCTAssertNotEqual([finalSubentities indexOfObject:entity], NSNotFound, @"Subentities list should contain '%@' entity", entityName);

    entityName = @"VehiclePlane";
    entity = [[_model entitiesByName] objectForKey:entityName];
    XCTAssertFalse([entity CTX_hasSubentities], @"%@ has subentities", entityName);
    XCTAssertNotEqual([finalSubentities indexOfObject:entity], NSNotFound, @"Subentities list should contain '%@' entity", entityName);
    
    entityName = @"VehicleCarSport";
    entity = [[_model entitiesByName] objectForKey:entityName];
    XCTAssertFalse([entity CTX_hasSubentities], @"%@ has subentities", entityName);
    XCTAssertNotEqual([finalSubentities indexOfObject:entity], NSNotFound, @"Subentities list should contain '%@' entity", entityName);
    
    entityName = @"VehicleCarTruck";
    entity = [[_model entitiesByName] objectForKey:entityName];
    XCTAssertFalse([entity CTX_hasSubentities], @"%@ has subentities", entityName);
    XCTAssertNotEqual([finalSubentities indexOfObject:entity], NSNotFound, @"Subentities list should contain '%@' entity", entityName);
    
    entityName = @"VehicleCar";
    entity = [[_model entitiesByName] objectForKey:entityName];
    XCTAssertTrue([entity CTX_hasSubentities], @"%@ has subentities", entityName);
    XCTAssertEqual([finalSubentities indexOfObject:entity], NSNotFound, @"Subentities list should contain '%@' abstract entity", entityName);
}

@end
