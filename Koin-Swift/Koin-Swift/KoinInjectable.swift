//
//  KoinInjectable.swift
//  Koin-Swift
//
//  Created by DE NADAI Julien on 22/04/2019.
//  Copyright © 2019 insertkoin.io. All rights reserved.
//

import Foundation

public protocol KoinInjectable {
    func get<T>() throws -> T
    func get<T>(withQualifier: Qualifier?) throws -> T
}

extension KoinInjectable {
    func get<T>() throws -> T {
        return try Koin.shared.get()
    }
    func get<T>(withQualifier: Qualifier?) throws -> T {
        return try Koin.shared.get(withQualifier: withQualifier)
    }
}
