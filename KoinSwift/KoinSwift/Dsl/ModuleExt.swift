//
//  ModuleExt.swift
//  KoinSwift
//
//  Created by DE NADAI Julien (i-BP - INFOTEL) on 30/04/2019.
//  Copyright © 2019 insertkoin.io. All rights reserved.
//

import Foundation

public extension Module {
    func factory<T>(qualifier: String? = nil, _ definition: @escaping Definition<T>) {
        let beanDefinition = createFactory(qualifier: qualifier, definition: definition)
        definitions.append(AnyHashable(beanDefinition))
    }
    func single<T>(qualifier: String? = nil, _ definition: @escaping Definition<T>) {
        let beanDefinition = createSingleton(qualifier: qualifier, definition: definition)
        definitions.append(AnyHashable(beanDefinition))
    }
}
