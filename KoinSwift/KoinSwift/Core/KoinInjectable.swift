//
//  KoinInjectable.swift
//  KoinSwift
//
//  Created by DE NADAI Julien on 22/04/2019.
//  Copyright © 2019 insertkoin.io. All rights reserved.
//

import Foundation

public protocol KoinInjectable {}

public extension KoinInjectable {
    
    
    public func get<T>(withQualifier: Qualifier? = nil) throws -> T {
        guard let koin = GlobalContext.shared.app else {
            throw KoinErrors.NotInitialized
        }
        return try koin.get(withQualifier: withQualifier)
    }
}
