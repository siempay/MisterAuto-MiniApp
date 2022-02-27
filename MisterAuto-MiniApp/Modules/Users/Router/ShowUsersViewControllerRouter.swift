//
//  ShowUsersViewControllerRouter.swift
//  MisterAuto-MiniApp
//
//  Created by Brahim ELMSSILHA on 2/27/22.
//

import Foundation


class ShowUsersViewControllerRouter: AnyRouter {
    var entry: AnyView?
    
    static func start() -> AnyRouter {
        
        let router = ShowUsersViewControllerRouter()
        let view = ShowUsersViewController()
        let presenter = ShowUsersViewControllerPresenter()
        let interactor = ShowUsersViewControllerInteractor()
    
        presenter.interator = interactor
        presenter.view = view
        presenter.router = router
        interactor.presenter = presenter
        view.presenter = presenter
        router.entry = view
            
        return router
    }
    
    
    
}
