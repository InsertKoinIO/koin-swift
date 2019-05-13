//
//  BeanRegistry.swift
//  KoinSwift
//
//  Created by DE NADAI Julien on 12/04/2019.
//  Copyright © 2019 insertkoin.io. All rights reserved.
//

import Foundation

class BeanRegistry {

    var definitions: Set<AnyHashable> = []
    
    func insertDefinition(definition: AnyHashable) throws {
        let (state, _) = definitions.insert(definition)
        guard state else {
            throw KoinErrors.AlreadyDefined
        }
    }
    
    func retrieveDefinition<T>(withQualifier: Qualifier? = nil) throws -> BeanDefinition<T> {
        guard let definition = definitions.first(where: { (definition) -> Bool in
            guard let base = definition.base as? BeanDefinition<T> else {
                return false
            }
            return withQualifier == nil || base.qualifier == withQualifier
            
        }) else {
            throw KoinErrors.DefinitionNotFound
        }
        return definition.base as! BeanDefinition<T>
    }
}
