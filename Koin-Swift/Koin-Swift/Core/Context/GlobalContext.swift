//
//  GlobalContext.swift
//  Koin-Swift
//
//  Created by DE NADAI Julien (i-BP - INFOTEL) on 30/04/2019.
//  Copyright © 2019 Julien De Nadai. All rights reserved.
//

import Foundation

public class GlobalContext {
    
    public static let shared: GlobalContext = GlobalContext()
    
    func start(koin: Koin) throws {
        guard app == nil else {
            throw KoinErrors.AlreadyInitialized
        }
        app = koin
    }
    
    public func stop() throws {
        throw KoinErrors.NotImplementedYet
    }
    
    var app: Koin? = nil
    
    private init() {}
}
