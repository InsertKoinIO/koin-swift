//
//  GlobalContext.swift
//  KoinSwift
//
//  Created by DE NADAI Julien (i-BP - INFOTEL) on 30/04/2019.
//  Copyright © 2019 insertkoin.io. All rights reserved.
//

import Foundation

public class GlobalContext {
    static let shared: GlobalContext = GlobalContext()
    func start(koin: Koin) throws {
        guard app == nil else {
            throw KoinErrors.alreadyInitialized
        }
        app = koin
    }
    func stop() throws {
        throw KoinErrors.notImplementedYet
    }
    var app: Koin?
    private init() {}
}
