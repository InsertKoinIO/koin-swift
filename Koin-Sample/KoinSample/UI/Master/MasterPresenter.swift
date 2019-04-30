//
//  File.swift
//  Koin-Sample
//
//  Created by DE NADAI Julien on 22/04/2019.
//  Copyright © 2019 insertkoin.io. All rights reserved.
//

import Foundation

class MasterPresenterImpl: MasterPresenter {
    
    /*weak*/ var view: MasterView?
    
    private let provider : DataProvider
    
    init(_ provider: DataProvider) {
        self.provider = provider
    }
    
    func loadItems() {
        view?.displayitems(provider.getAll())
    }
    
    func add(_ obj: String, at: Int) {
        provider.put(obj)
        loadItems()
    }
    
    
}
