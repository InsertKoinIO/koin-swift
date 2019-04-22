//
//  MasterModule.swift
//  Koin-Sample
//
//  Created by DE NADAI Julien on 22/04/2019.
//  Copyright © 2019 insertkoin.io. All rights reserved.
//

import Foundation
import Koin_Swift

let masterModule = module {
    $0.factory {
        return MasterPresenterImpl(try $0.get()) as MasterPresenter
    }
    
    $0.single { _ -> DataProvider in
        return DummyDataProvider()
    }
}
