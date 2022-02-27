//
//  ShowUserTasksViewControllerPresenter.swift
//  MisterAuto-MiniApp
//
//  Created by Brahim ELMSSILHA on 2/27/22.
//

import Foundation


class ShowUserTasksViewControllerPresenter: AnyPresenter {
    
    var router: AnyRouter?
    var view: AnyView?
    var _view: ShowUserTasksViewController? {
        self.view as? ShowUserTasksViewController
    }

    var interator: AnyInteractor?
    var _interator: ShowUserTasksViewControllerInteractor? {
        interator as? ShowUserTasksViewControllerInteractor
    }

    
    func didLoadView(userId: Int64) {
        
        DispatchQueue.main.async {
            do{
                try self._interator?.getAllTaksBy(userId: userId)
            }catch{
                print(error)
                self._view?.showError(error)
            }
        }
    }
    
    // MARK:- Interactor
    
    func didFetchTasks(_ users: [ShowUserTask]) {
        
        DispatchQueue.main.async {

            self._view?.ShowUserTasks(users)
        }
    }
    
    func didFetchTasks(_ error: Error) {
        
        DispatchQueue.main.async {

            self._view?.showError(error)
        }
    }
}
