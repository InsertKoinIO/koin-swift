//
//  BeanRegistry.swift
//  Koin-Swift
//
//  Created by DE NADAI Julien on 12/04/2019.
//  Copyright © 2019 Julien De Nadai. All rights reserved.
//

import Foundation

class BeanRegistry {

    var definitions: Set<AnyHashable> = []
    
    func insertDefinition<T>(definition: BeanDefinition<T>) throws {
        let (state, _) = definitions.insert(definition)
        guard state else {
            throw KoinErrors.AlreadyDefined
        }
    }
    
    func retrieveDefinition<T>(qualifier: Qualifier? = nil) throws -> BeanDefinition<T> {
        guard let definition = definitions.first(where: {(definition) -> Bool in
            guard let base = definition.base as? BeanDefinition<T> else {
                return false
            }
            return base.qualifier == qualifier
        }) else {
            throw KoinErrors.DefinitionNotFound
        }
        return definition.base as! BeanDefinition<T>
    }
}
