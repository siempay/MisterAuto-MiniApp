//
//  ShowUserTasksViewControllerInteractor.swift
//  MisterAuto-MiniApp
//
//  Created by Brahim ELMSSILHA on 2/27/22.
//

import Foundation


class ShowUserTasksViewControllerInteractor: AnyInteractor {
    
    var presenter: AnyPresenter?
    var _presenter: ShowUserTasksViewControllerPresenter? {
        presenter as? ShowUserTasksViewControllerPresenter
    }
    
    
    /// Make call to api to get users
    func getAllTaksBy(userId: Int64) throws {
        
        try NetworkService.shared.makeRequest(.tasksByUser(userId)) { [weak self] (result) in
            
            switch result {
            
            case .failure(let error):
                self?._presenter?.didFetchTasks(error)
                break
                
            case .success(let data):
                
                self?.didGetAllTaks(data: data)
                break
            }
        }
        
    }
    
    /// Handle successful response
    func didGetAllTaks(data: Data?) {
        
        guard let _data = data else {
            self._presenter?.didFetchTasks([])
            return
        }
        
        do{
            let decoded = try [ShowUserTask].decode(_data)
            self._presenter?.didFetchTasks(decoded)
        }catch{
            self._presenter?.didFetchTasks(error)
        }
        
    }
    
}
