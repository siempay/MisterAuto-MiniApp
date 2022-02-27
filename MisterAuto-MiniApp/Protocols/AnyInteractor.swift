//
//  AnyInteractor.swift
//  MisterAuto-MiniApp
//
//  Created by Brahim ELMSSILHA on 2/27/22.
//

import Foundation


protocol AnyInteractor {
    
    var presenter: AnyPresenter? { get set }
}
