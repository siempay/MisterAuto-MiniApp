//
//  ShowUserTasksViewControllerRouter.swift
//  MisterAuto-MiniApp
//
//  Created by Brahim ELMSSILHA on 2/27/22.
//

import UIKit


class ShowUserTasksViewControllerRouter: AnyRouter {
    var entry: AnyView?
    
    static func start() -> AnyRouter {
        
        let router = ShowUserTasksViewControllerRouter()
        let view = ShowUserTasksViewController()
        let presenter = ShowUserTasksViewControllerPresenter()
        let interactor = ShowUserTasksViewControllerInteractor()
    
        presenter.interator = interactor
        presenter.view = view
        presenter.router = router
        interactor.presenter = presenter
        view.presenter = presenter
        router.entry = view
            
        return router
    }
    
    func pushTaksBy(user: ShowUser) {
        
        let router = ShowUserTasksViewControllerRouter.start()
        
        let navigator = entry?.navigationController
        
        navigator?.pushViewController(router.entry!, animated: true)

    }
    
}
