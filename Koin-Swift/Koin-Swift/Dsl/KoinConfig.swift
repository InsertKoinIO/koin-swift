//
//  KoinConfig.swift
//  Koin-Swift
//
//  Created by DE NADAI Julien on 30/04/2019.
//  Copyright © 2019 insertkoin.io. All rights reserved.
//

import Foundation

public class KoinConfig {
    
    var modules = [Module]()
    
    public func modules(_ modules: Module...) {
        self.modules += modules
    }
    
    init() {}
}
