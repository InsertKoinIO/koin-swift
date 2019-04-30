//
//  DummyDataProvider.swift
//  Koin-Sample
//
//  Created by DE NADAI Julien on 22/04/2019.
//  Copyright © 2019 insertkoin.io. All rights reserved.
//

import Foundation

class DummyDataProvider : DataProvider {
    
    private var objects : [String] = ["test1", "test2", "test3"]
    
    func getAll() -> [String] {
        return objects
    }
    
    func put(_ obj: String) {
        objects.append(obj)
    }
    
    
}
