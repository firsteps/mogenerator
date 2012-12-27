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
    
    [super tearDown];
}

- (void)test_01_NSEntityDescription_dtoClassNameIsGeneratedCorrectly
{
    NSEntityDescription *entity = nil;
    
    entity = [[_model entitiesByName] objectForKey:@"TestObject"];
    STAssertEqualObjects(@"TestObjectDTO", [entity CTX_dtoClassName], @"DTO class name is incorrect");

    entity = [[_model entitiesByName] objectForKey:@"MOTestObject"];
    STAssertEqualObjects(@"MOTestObjectDTO", [entity CTX_dtoClassName], @"DTO class name is incorrect");

    entity = [[_model entitiesByName] objectForKey:@"TestMOObject"];
    STAssertEqualObjects(@"TestMOObjectDTO", [entity CTX_dtoClassName], @"DTO class name is incorrect");

    entity = [[_model entitiesByName] objectForKey:@"TestObjectMO"];
    STAssertEqualObjects(@"TestObjectDTO", [entity CTX_dtoClassName], @"DTO class name is incorrect");
}

- (void)test_02_NSPropertyDescription_shouldBePersistedInDTO
{
    NSPropertyDescription *property = [[NSPropertyDescription alloc] init];

    STAssertTrue([property CTX_shouldBePersistedInDTO], @"- [NSPropertyDescription CTX_shouldBePersistedInDTO] is broken");

    [property setUserInfo:@{@"com.ef.ctx.mogenerator.dto.shouldNotBePersisted" : @"NO"}];
    STAssertTrue([property CTX_shouldBePersistedInDTO], @"- [NSPropertyDescription CTX_shouldBePersistedInDTO] is broken");
    
    [property setUserInfo:@{@"com.ef.ctx.mogenerator.dto.shouldNotBePersisted" : @"no"}];
    STAssertTrue([property CTX_shouldBePersistedInDTO], @"- [NSPropertyDescription CTX_shouldBePersistedInDTO] is broken");
    
    [property setUserInfo:@{@"com.ef.ctx.mogenerator.dto.shouldNotBePersisted" : @"false"}];
    STAssertTrue([property CTX_shouldBePersistedInDTO], @"- [NSPropertyDescription CTX_shouldBePersistedInDTO] is broken");
    
    [property setUserInfo:@{@"com.ef.ctx.mogenerator.dto.shouldNotBePersisted" : @"FALSE"}];
    STAssertTrue([property CTX_shouldBePersistedInDTO], @"- [NSPropertyDescription CTX_shouldBePersistedInDTO] is broken");
    
    [property setUserInfo:@{@"com.ef.ctx.mogenerator.dto.shouldNotBePersisted" : @" FaLSe    "}];
    STAssertTrue([property CTX_shouldBePersistedInDTO], @"- [NSPropertyDescription CTX_shouldBePersistedInDTO] is broken");

    [property setUserInfo:@{@"com.ef.ctx.mogenerator.dto.shouldNotBePersisted" : @""}];
    STAssertFalse([property CTX_shouldBePersistedInDTO], @"- [NSPropertyDescription CTX_shouldBePersistedInDTO] is broken");

    [property setUserInfo:@{@"com.ef.ctx.mogenerator.dto.shouldNotBePersisted" : @"YES"}];
    STAssertFalse([property CTX_shouldBePersistedInDTO], @"- [NSPropertyDescription CTX_shouldBePersistedInDTO] is broken");
    
    [property setUserInfo:@{@"com.ef.ctx.mogenerator.dto.shouldNotBePersisted" : @"NO false"}];
    STAssertFalse([property CTX_shouldBePersistedInDTO], @"- [NSPropertyDescription CTX_shouldBePersistedInDTO] is broken");

    [property setUserInfo:@{@"com.ef.ctx.mogenerator.dto.shouldNotBePersisted" : @"Just any string here bla-bla"}];
    STAssertFalse([property CTX_shouldBePersistedInDTO], @"- [NSPropertyDescription CTX_shouldBePersistedInDTO] is broken");
}

- (void)test_03_NSPropertyDescription_isMandatoryInDTO
{    
    NSPropertyDescription *property = [[NSPropertyDescription alloc] init];

    STAssertFalse([property CTX_isMandatoryInDTO], @"- [NSPropertyDescription CTX_isMandatoryInDTO] is broken");
    
    [property setUserInfo:@{@"com.ef.ctx.mogenerator.dto.mandatory" : @"NO"}];
    STAssertFalse([property CTX_isMandatoryInDTO], @"- [NSPropertyDescription CTX_isMandatoryInDTO] is broken");
    
    [property setUserInfo:@{@"com.ef.ctx.mogenerator.dto.mandatory" : @"no"}];
    STAssertFalse([property CTX_isMandatoryInDTO], @"- [NSPropertyDescription CTX_isMandatoryInDTO] is broken");
    
    [property setUserInfo:@{@"com.ef.ctx.mogenerator.dto.mandatory" : @"false"}];
    STAssertFalse([property CTX_isMandatoryInDTO], @"- [NSPropertyDescription CTX_isMandatoryInDTO] is broken");
    
    [property setUserInfo:@{@"com.ef.ctx.mogenerator.dto.mandatory" : @"FALSE"}];
    STAssertFalse([property CTX_isMandatoryInDTO], @"- [NSPropertyDescription CTX_isMandatoryInDTO] is broken");
    
    [property setUserInfo:@{@"com.ef.ctx.mogenerator.dto.mandatory" : @"  fALSe  "}];
    STAssertFalse([property CTX_isMandatoryInDTO], @"- [NSPropertyDescription CTX_isMandatoryInDTO] is broken");

    [property setUserInfo:@{@"com.ef.ctx.mogenerator.dto.mandatory" : @""}];
    STAssertTrue([property CTX_isMandatoryInDTO], @"- [NSPropertyDescription CTX_isMandatoryInDTO] is broken");
    
    [property setUserInfo:@{@"com.ef.ctx.mogenerator.dto.mandatory" : @"YES"}];
    STAssertTrue([property CTX_isMandatoryInDTO], @"- [NSPropertyDescription CTX_isMandatoryInDTO] is broken");
    
    [property setUserInfo:@{@"com.ef.ctx.mogenerator.dto.mandatory" : @"No FalSe"}];
    STAssertTrue([property CTX_isMandatoryInDTO], @"- [NSPropertyDescription CTX_isMandatoryInDTO] is broken");
    
    [property setUserInfo:@{@"com.ef.ctx.mogenerator.dto.mandatory" : @"Just any STRING..."}];
    STAssertTrue([property CTX_isMandatoryInDTO], @"- [NSPropertyDescription CTX_isMandatoryInDTO] is broken");
}

- (void)test_04_NSRelationshipDescription_shouldBeDeletedWhenUnset
{
    NSRelationshipDescription *relationship = [[NSRelationshipDescription alloc] init];
    
    STAssertTrue([relationship CTX_shouldBeDeletedWhenUnset], @"- [NSRelationshipDescription CTX_shouldBeDeletedWhenUnset] is broken");

    [relationship setUserInfo:@{@"com.ef.ctx.mogenerator.mo.shouldNotBeDeletedWhenUnset" : @"NO"}];
    STAssertTrue([relationship CTX_shouldBeDeletedWhenUnset], @"- [NSRelationshipDescription CTX_shouldBeDeletedWhenUnset] is broken");
    
    [relationship setUserInfo:@{@"com.ef.ctx.mogenerator.mo.shouldNotBeDeletedWhenUnset" : @"no"}];
    STAssertTrue([relationship CTX_shouldBeDeletedWhenUnset], @"- [NSRelationshipDescription CTX_shouldBeDeletedWhenUnset] is broken");
    
    [relationship setUserInfo:@{@"com.ef.ctx.mogenerator.mo.shouldNotBeDeletedWhenUnset" : @"FALSE"}];
    STAssertTrue([relationship CTX_shouldBeDeletedWhenUnset], @"- [NSRelationshipDescription CTX_shouldBeDeletedWhenUnset] is broken");
    
    [relationship setUserInfo:@{@"com.ef.ctx.mogenerator.mo.shouldNotBeDeletedWhenUnset" : @"false"}];
    STAssertTrue([relationship CTX_shouldBeDeletedWhenUnset], @"- [NSRelationshipDescription CTX_shouldBeDeletedWhenUnset] is broken");
    
    [relationship setUserInfo:@{@"com.ef.ctx.mogenerator.mo.shouldNotBeDeletedWhenUnset" : @"  FAlSe        "}];
    STAssertTrue([relationship CTX_shouldBeDeletedWhenUnset], @"- [NSRelationshipDescription CTX_shouldBeDeletedWhenUnset] is broken");
    
    [relationship setUserInfo:@{@"com.ef.ctx.mogenerator.mo.shouldNotBeDeletedWhenUnset" : @""}];
    STAssertFalse([relationship CTX_shouldBeDeletedWhenUnset], @"- [NSRelationshipDescription CTX_shouldBeDeletedWhenUnset] is broken");
    
    [relationship setUserInfo:@{@"com.ef.ctx.mogenerator.mo.shouldNotBeDeletedWhenUnset" : @"YES"}];
    STAssertFalse([relationship CTX_shouldBeDeletedWhenUnset], @"- [NSRelationshipDescription CTX_shouldBeDeletedWhenUnset] is broken");
    
    [relationship setUserInfo:@{@"com.ef.ctx.mogenerator.mo.shouldNotBeDeletedWhenUnset" : @"NO FALSE"}];
    STAssertFalse([relationship CTX_shouldBeDeletedWhenUnset], @"- [NSRelationshipDescription CTX_shouldBeDeletedWhenUnset] is broken");
    
    [relationship setUserInfo:@{@"com.ef.ctx.mogenerator.mo.shouldNotBeDeletedWhenUnset" : @"Just any string. Any!!!!1!!111"}];
    STAssertFalse([relationship CTX_shouldBeDeletedWhenUnset], @"- [NSRelationshipDescription CTX_shouldBeDeletedWhenUnset] is broken");    
}

- (void)test_05_NSRelationshipDescription_shouldBeRepopulatedFromDTOWhenSet
{
    NSRelationshipDescription *relationship = [[NSRelationshipDescription alloc] init];
    
    STAssertFalse([relationship CTX_shouldBeRepopulatedFromDTOWhenSet], @"- [NSRelationshipDescription CTX_shouldBeRepopulatedFromDTOWhenSet] is broken");
    
    [relationship setUserInfo:@{@"com.ef.ctx.mogenerator.mo.shouldBeRepopulatedFromDTOWhenSet" : @"NO"}];
    STAssertFalse([relationship CTX_shouldBeRepopulatedFromDTOWhenSet], @"- [NSRelationshipDescription CTX_shouldBeRepopulatedFromDTOWhenSet] is broken");
    
    [relationship setUserInfo:@{@"com.ef.ctx.mogenerator.mo.shouldBeRepopulatedFromDTOWhenSet" : @"no"}];
    STAssertFalse([relationship CTX_shouldBeRepopulatedFromDTOWhenSet], @"- [NSRelationshipDescription CTX_shouldBeRepopulatedFromDTOWhenSet] is broken");
    
    [relationship setUserInfo:@{@"com.ef.ctx.mogenerator.mo.shouldBeRepopulatedFromDTOWhenSet" : @"FALSE"}];
    STAssertFalse([relationship CTX_shouldBeRepopulatedFromDTOWhenSet], @"- [NSRelationshipDescription CTX_shouldBeRepopulatedFromDTOWhenSet] is broken");
    
    [relationship setUserInfo:@{@"com.ef.ctx.mogenerator.mo.shouldBeRepopulatedFromDTOWhenSet" : @"false"}];
    STAssertFalse([relationship CTX_shouldBeRepopulatedFromDTOWhenSet], @"- [NSRelationshipDescription CTX_shouldBeRepopulatedFromDTOWhenSet] is broken");
    
    [relationship setUserInfo:@{@"com.ef.ctx.mogenerator.mo.shouldBeRepopulatedFromDTOWhenSet" : @"  FAlSe        "}];
    STAssertFalse([relationship CTX_shouldBeRepopulatedFromDTOWhenSet], @"- [NSRelationshipDescription CTX_shouldBeRepopulatedFromDTOWhenSet] is broken");
    
    [relationship setUserInfo:@{@"com.ef.ctx.mogenerator.mo.shouldBeRepopulatedFromDTOWhenSet" : @""}];
    STAssertTrue([relationship CTX_shouldBeRepopulatedFromDTOWhenSet], @"- [NSRelationshipDescription CTX_shouldBeRepopulatedFromDTOWhenSet] is broken");
    
    [relationship setUserInfo:@{@"com.ef.ctx.mogenerator.mo.shouldBeRepopulatedFromDTOWhenSet" : @"YES"}];
    STAssertTrue([relationship CTX_shouldBeRepopulatedFromDTOWhenSet], @"- [NSRelationshipDescription CTX_shouldBeRepopulatedFromDTOWhenSet] is broken");
    
    [relationship setUserInfo:@{@"com.ef.ctx.mogenerator.mo.shouldBeRepopulatedFromDTOWhenSet" : @"NO FALSE"}];
    STAssertTrue([relationship CTX_shouldBeRepopulatedFromDTOWhenSet], @"- [NSRelationshipDescription CTX_shouldBeRepopulatedFromDTOWhenSet] is broken");
    
    [relationship setUserInfo:@{@"com.ef.ctx.mogenerator.mo.shouldBeRepopulatedFromDTOWhenSet" : @"Just any string. Any!!!!1!!111"}];
    STAssertTrue([relationship CTX_shouldBeRepopulatedFromDTOWhenSet], @"- [NSRelationshipDescription CTX_shouldBeRepopulatedFromDTOWhenSet] is broken");
}

@end
