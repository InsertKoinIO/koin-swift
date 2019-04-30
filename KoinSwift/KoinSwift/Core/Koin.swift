//
//  File.swift
//  KoinSwift
//
//  Created by DE NADAI Julien on 12/04/2019.
//  Copyright © 2019 insertkoin.io. All rights reserved.
//

import Foundation

class Koin : KoinInjectable {

    let beanRegistry = BeanRegistry()
    
    func get<T>() throws -> T {
        let definition : BeanDefinition<T> = try beanRegistry.retrieveDefinition()
        return try definition.resolveInstance(koin: self)
    }
    
    func get<T>(withQualifier: Qualifier? = nil) throws -> T {
        let definition : BeanDefinition<T> = try beanRegistry.retrieveDefinition(withQualifier: withQualifier)
        return try definition.resolveInstance(koin: self)
    }
    
    func insert(definition: AnyHashable) throws {
        try beanRegistry.insertDefinition(definition: definition)
    }
    
    func apply(with config: KoinConfig) throws {
        try config.modules.forEach { module in
            try module.definitions.forEach { definition in
                try insert(definition: definition)
            }
        }
    }
}
