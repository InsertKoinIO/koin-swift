//
//  ModuleExt.swift
//  Koin-Swift
//
//  Created by DE NADAI Julien (i-BP - INFOTEL) on 30/04/2019.
//  Copyright © 2019 Julien De Nadai. All rights reserved.
//

import Foundation

public extension Module {
    
    public func factory<T>(qualifier: String? = nil, _ definition: @escaping Definition<T>) {
        let beanDefinition = createFactory(qualifier: qualifier, definition: definition)
        definitions.append(AnyHashable(beanDefinition))
    }
    
    public func single<T>(qualifier: String? = nil, _ definition: @escaping Definition<T>) {
        let beanDefinition = createSingleton(qualifier: qualifier, definition: definition)
        definitions.append(AnyHashable(beanDefinition))
    }
}
