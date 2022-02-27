//
//  AnyRouter.swift
//  MisterAuto-MiniApp
//
//  Created by Brahim ELMSSILHA on 2/27/22.
//

import Foundation

protocol AnyRouter: class {
    
    var entry: AnyView? { get }
    
    static func start() -> AnyRouter
}



