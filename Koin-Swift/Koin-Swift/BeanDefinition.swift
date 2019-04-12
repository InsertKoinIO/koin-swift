//
//  BeanDefinition.swift
//  Koin-Swift
//
//  Created by DE NADAI Julien on 12/04/2019.
//  Copyright © 2019 Julien De Nadai. All rights reserved.
//

import Foundation

class BeanDefinition<T> : Hashable {
    let definition: Definition<T>
    let qualifier: Qualifier?
    let kind: Kind
    
    private var instance: T? = nil
    
    init(definition: @escaping Definition<T>, qualifier: Qualifier? = nil, kind: Kind = .Single) {
        self.definition = definition
        self.qualifier = qualifier
        self.kind = kind
    }
    
    func resolveInstance(koin: KoinInjectable) throws -> T {
        switch(kind) {
        case .Factory: return try definition(koin)
        case .Single: return try single(koin: koin)
        }
    }
    
    func single(koin: KoinInjectable) throws -> T {
        if let instance = instance {
            return instance
        } else {
            let value = try definition(koin)
            instance = value
            return value
        }
    }
    
    public func hash(into hasher: inout Hasher) {
        hasher.combine("\(T.self)")
        hasher.combine(qualifier)
    }
    
    public static func ==<R> (lhs: BeanDefinition<T>, rhs: BeanDefinition<R>) -> Bool {
        return "\(T.self)-\(lhs.qualifier ?? "##NoQualifier##")" == "\(R.self)-\(rhs.qualifier ?? "##NoQualifier##")"
    }
}
