//
//  DataProvider.swift
//  Koin-Sample
//
//  Created by DE NADAI Julien on 22/04/2019.
//  Copyright © 2019 insertkoin.io. All rights reserved.
//

import Foundation

protocol DataProvider {
    func getAll() -> [String]
    func put(_ obj: String)
}
