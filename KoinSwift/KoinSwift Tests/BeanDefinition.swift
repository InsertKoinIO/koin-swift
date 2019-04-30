//
//  BeanDefinition.swift
//  KoinSwift Tests
//
//  Created by DE NADAI Julien on 12/04/2019.
//  Copyright © 2019 insertkoin.io. All rights reserved.
//

import Foundation

import XCTest
@testable import KoinSwift

class BeanDefinitionTests: XCTestCase {

    func testSingle() {
        let koin = MockKoin()

        let def1 = BeanDefinition<String>(
            definition: { _ throws in "def1"},
            qualifier: nil,
            kind: .Single
        )
        
        let value1 = try! def1.resolveInstance(koin: koin)
        let value2 = try! def1.resolveInstance(koin: koin)
        
        XCTAssertEqual(value1, value2, "\(value1) != \(value2)")
    }

}

class MockKoin: KoinInjectable {
    func get<T>(qualifier: Qualifier? = nil) throws -> T {
        throw KoinErrors.NotImplementedYet
    }
}
