//
//  MasterProtocols.swift
//  Koin-Sample
//
//  Created by DE NADAI Julien on 22/04/2019.
//  Copyright © 2019 insertkoin.io. All rights reserved.
//

import Foundation

protocol MasterPresenter {
    
    var view : MasterView? {
        get
        set
    }

    func loadItems()
    
    func add(_ obj: String, at : Int)
}

protocol MasterView {
    func displayitems(_ objs: [String])
}
