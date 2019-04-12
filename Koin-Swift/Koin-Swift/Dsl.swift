//
//  Dsl.swift
//  Koin-Swift
//
//  Created by DE NADAI Julien on 12/04/2019.
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

public func module(_ closure: ModuleDeclaration) -> Module {
    let module = Module()
    closure(module)
    return module
}

public func registerKoinModule(_ modules: Module...) throws {
    try modules.forEach({ module throws in
        try module.definitions.forEach({ definition throws in
            try KoinApplication.shared.insert(definition: definition)
        })
    })
}

public func inject<T>() throws -> T {
    return try KoinApplication.shared.get()
}
