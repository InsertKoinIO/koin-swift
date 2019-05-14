//
//  DefinitionFactory.swift
//  KoinSwift
//
//  Created by DE NADAI Julien on 12/04/2019.
//  Copyright © 2019 insertkoin.io. All rights reserved.
//

import Foundation

func createSingleton<T>(qualifier: String?, definition: @escaping Definition<T>) -> BeanDefinition<T> {
    return createDefinition(qualifier: qualifier, definition: definition, kind: Kind.single)
}

func createFactory<T>(qualifier: String?, definition: @escaping Definition<T>) -> BeanDefinition<T> {
    return createDefinition(qualifier: qualifier, definition: definition, kind: Kind.factory)
}

private func createDefinition<T>(
    qualifier: String?,
    definition: @escaping Definition<T>,
    kind: Kind = Kind.single
) -> BeanDefinition<T> {
    let beanDefinition: BeanDefinition<T> = BeanDefinition(definition: definition, qualifier: qualifier, kind: kind)
    return beanDefinition
}
