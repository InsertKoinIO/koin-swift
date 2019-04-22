//
//  File.swift
//  Koin-Swift
//
//  Created by DE NADAI Julien on 12/04/2019.
//  Copyright © 2019 insertkoin.io. All rights reserved.
//

import Foundation

public class Koin : KoinInjectable {
    static let shared = Koin()
    private let beanRegistry = BeanRegistry()
    
    public func get<T>() throws -> T {
        let definition : BeanDefinition<T> = try beanRegistry.retrieveDefinition()
        return try definition.resolveInstance(koin: self)
    }
    
    public func get<T>(withQualifier: Qualifier? = nil) throws -> T {
        let definition : BeanDefinition<T> = try beanRegistry.retrieveDefinition(withQualifier: withQualifier)
        return try definition.resolveInstance(koin: self)
    }
    
    func insert(definition: AnyHashable) throws {
        try beanRegistry.insertDefinition(definition: definition)
    }
}
