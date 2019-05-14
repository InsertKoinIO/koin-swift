//
//  BeanDefinition.swift
//  KoinSwift
//
//  Created by DE NADAI Julien on 12/04/2019.
//  Copyright © 2019 insertkoin.io. All rights reserved.
//

import Foundation

class BeanDefinition<T> : Hashable {
    let definition: Definition<T>
    let qualifier: Qualifier?
    let kind: Kind
    private var instance: T?
    init(definition: @escaping Definition<T>, qualifier: Qualifier? = nil, kind: Kind = .single) {
        self.definition = definition
        self.qualifier = qualifier
        self.kind = kind
    }
    func resolveInstance(koin: KoinInjectable) throws -> T {
        switch kind {
        case .factory: return try definition(koin)
        case .single: return try single(koin: koin)
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
