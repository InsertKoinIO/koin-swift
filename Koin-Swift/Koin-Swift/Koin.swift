//
//  File.swift
//  Koin-Swift
//
//  Created by DE NADAI Julien on 12/04/2019.
//  Copyright © 2019 Julien De Nadai. All rights reserved.
//

import Foundation

protocol Koin {
    func get<T>(qualifier: Qualifier?) throws -> T
}

public class KoinApplication : Koin {
    static let shared = KoinApplication()
    private let beanRegistry = BeanRegistry()
    
    func get<T>(qualifier: Qualifier? = nil) throws -> T {
        let definition : BeanDefinition<T> = try beanRegistry.retrieveDefinition()
        return try definition.resolveInstance(koin: self)
    }
}

public func get<T>() throws -> T {
    return try KoinApplication.shared.get()
}
