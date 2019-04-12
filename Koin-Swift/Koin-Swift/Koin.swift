//
//  File.swift
//  Koin-Swift
//
//  Created by DE NADAI Julien on 12/04/2019.
//  Copyright © 2019 Julien De Nadai. All rights reserved.
//

import Foundation

public protocol KoinInjectable {
    func get<T>(qualifier: Qualifier?) throws -> T
}

public class KoinApplication : KoinInjectable {
    static let shared = KoinApplication()
    private let beanRegistry = BeanRegistry()
    
    public func get<T>(qualifier: Qualifier? = nil) throws -> T {
        let definition : BeanDefinition<T> = try beanRegistry.retrieveDefinition()
        return try definition.resolveInstance(koin: self)
    }
    
    func insert(definition: AnyHashable) throws {
        try beanRegistry.insertDefinition(definition: definition)
    }
}
