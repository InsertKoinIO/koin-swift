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
            throw KoinErrors.alreadyDefined
        }
    }
    func retrieveDefinition<T>(withQualifier: Qualifier? = nil) throws -> BeanDefinition<T> {
        let base = definitions
            .map { $0.base }
            .first { (base) -> Bool in
                guard let definition = base as? BeanDefinition<T> else {
                    return false
                }
                return withQualifier == nil || definition.qualifier == withQualifier
            }
        guard let definition = base as? BeanDefinition<T> else {
            throw KoinErrors.definitionNotFound
        }
        return definition
    }
}
