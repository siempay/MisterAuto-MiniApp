//
//  AnyPresenter.swift
//  MisterAuto-MiniApp
//
//  Created by Brahim ELMSSILHA on 2/27/22.
//

import Foundation

protocol AnyPresenter {
    
    var router: AnyRouter? { get set }
    var view: AnyView? { get set }
    var interator: AnyInteractor? { get set }
}
