//
//  AnyView.swift
//  MisterAuto-MiniApp
//
//  Created by Brahim ELMSSILHA on 2/27/22.
//

import UIKit

protocol AnyView where Self: UIViewController {
    
    var presenter: AnyPresenter? { get set }
}
