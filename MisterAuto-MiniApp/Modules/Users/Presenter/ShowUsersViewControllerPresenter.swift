//
//  ShowUsersViewControllerPresenter.swift
//  MisterAuto-MiniApp
//
//  Created by Brahim ELMSSILHA on 2/27/22.
//

import Foundation


class ShowUsersViewControllerPresenter: AnyPresenter {
    
    var router: AnyRouter?
    var view: AnyView?
    var _view: ShowUsersViewController? {
        self.view as? ShowUsersViewController
    }

    var interator: AnyInteractor?
    var _interator: ShowUsersViewControllerInteractor? {
        interator as? ShowUsersViewControllerInteractor
    }

    
    func didLoadView() {
        
        do{
            let cachedUsers = try _interator?.getCacheUsers()
            didFetchUsers(cachedUsers ?? [])
        }catch{
            didFetchUsers(error)
        }
        
        DispatchQueue.main.async {
            do{
                try self._interator?.getAllUsers()
            }catch{
                print(error)
                self._view?.showError(error)
            }
        }
    }
    
    func didSelectUser(_ user: ShowUser) {
        
        (router as? ShowUserTasksViewControllerRouter)?.pushTaksBy(user: user)
    }
    
    // MARK:- Interactor
    
    func didFetchUsers(_ users: [ShowUser]) {
        
        DispatchQueue.main.async {

            guard !users.isEmpty else {return}
            self._view?.showUsers(users)
        }
    }
    
    func didFetchUsers(_ error: Error) {
        
        DispatchQueue.main.async {

            self._view?.showError(error)
        }
    }
}
