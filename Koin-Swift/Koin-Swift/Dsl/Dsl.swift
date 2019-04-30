//
//  Dsl.swift
//  Koin-Swift
//
//  Created by DE NADAI Julien on 12/04/2019.
//  Copyright © 2019 insertkoin.io. All rights reserved.
//

import Foundation

public func module(_ closure: ModuleDeclaration) -> Module {
    let module = Module()
    closure(module)
    return module
}

public func registerKoinModule(_ modules: Module...) throws {
    try modules.forEach({ module throws in
        try module.definitions.forEach({ definition throws in
            guard let koin = GlobalContext.shared.app else {
                throw KoinErrors.NotInitialized
            }
            try koin.insert(definition: definition)
        })
    })
}

public func inject<T>(withQualifier: Qualifier? = nil) throws -> T {
    guard let koin = GlobalContext.shared.app else {
        throw KoinErrors.NotInitialized
    }
    return try koin.get(withQualifier: withQualifier)
}

public func startKoin(_ configure: (KoinConfig) -> Void) throws {
    let koin = Koin()
    let koinConfig = KoinConfig()
    configure(koinConfig)
    try koin.apply(with: koinConfig)
    try GlobalContext.shared.start(koin: koin)
}


