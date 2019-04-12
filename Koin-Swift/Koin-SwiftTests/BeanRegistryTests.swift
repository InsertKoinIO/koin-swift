//
//  BeanRegistryTest.swift
//  Koin-SwiftTests
//
//  Created by DE NADAI Julien on 12/04/2019.
//  Copyright © 2019 Julien De Nadai. All rights reserved.
//

import XCTest
@testable import Koin_Swift

class BeanRegistryTests: XCTestCase {
    
    func testDefinitionFound() {
        let beanRegistry = BeanRegistry()
        beanRegistry.definitions.insert(
            AnyHashable(BeanDefinition<String>(definition: { _ in "" }))
        )
        XCTAssertNoThrow(try beanRegistry.retrieveDefinition() as BeanDefinition<String>)
    }
    
    func testDefinitionNotFound() {
        let beanRegistry = BeanRegistry()
        XCTAssertThrowsError(try beanRegistry.retrieveDefinition() as BeanDefinition<String>)
    }
    
    func testDefinitionWithQualifier() {
        let beanRegistry = BeanRegistry()
        let def1 = BeanDefinition<String>(
            definition: { _ in "" }
        )
        let def2 = BeanDefinition<String>(
            definition: { _ in "withQualifier" },
            qualifier: "withQualifier"
        )
        
        beanRegistry.definitions.insert(AnyHashable(def1))
        beanRegistry.definitions.insert(AnyHashable(def2))
        
        let definition : BeanDefinition<String> = try! beanRegistry.retrieveDefinition(qualifier: "withQualifier")
        XCTAssertEqual(definition, def2, "")
    }
    
    func testOverrideDefinition() {
        
        let beanRegistry = BeanRegistry()
        let def1 = BeanDefinition<String>(
            definition: { _ in "" }
        )
        let def2 = BeanDefinition<String>(
            definition: { _ in "" }
        )
        try! beanRegistry.insertDefinition(definition: def1)
        XCTAssertThrowsError(try beanRegistry.insertDefinition(definition: def2), "Should throw exception when try to override def")
    }
    
    func testInsertSameTypeButWithQualifierDefinition() {
        
        let beanRegistry = BeanRegistry()
        let def1 = BeanDefinition<String>(
            definition: { _ in "withoutQualifier" }
        )
        let def2 = BeanDefinition<String>(
            definition: { _ in "withQualifier" },
            qualifier: "withQualifier"
        )
        try! beanRegistry.insertDefinition(definition: def1)
        XCTAssertNoThrow(try beanRegistry.insertDefinition(definition: def2), "Should not throw exception when try to insert def whith different qualifier")
    }
    
}
