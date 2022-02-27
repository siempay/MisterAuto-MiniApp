//
//  ShowUsersViewControllerInteractor.swift
//  MisterAuto-MiniApp
//
//  Created by Brahim ELMSSILHA on 2/27/22.
//

import Foundation


class ShowUsersViewControllerInteractor: AnyInteractor {
    
    var presenter: AnyPresenter?
    var _presenter: ShowUsersViewControllerPresenter? {
        presenter as? ShowUsersViewControllerPresenter
    }
    
    
    /// Make call to api to get users
    func getAllUsers() throws {
        
        try NetworkService.shared.makeRequest(.allUsers) { [weak self] (result) in
            
            switch result {
            
            case .failure(let error):
                self?._presenter?.didFetchUsers(error)
                break
                
            case .success(let data):
                
                self?.didGetAllUsers(data: data)
                break
            }
        }
        
    }
    
    /// Handle successful response
    func didGetAllUsers(data: Data?) {
        
        guard let _data = data else {
            self._presenter?.didFetchUsers([])
            return
        }
        
        do{
            let decoded = try [ShowUser].decode(_data)
            self._presenter?.didFetchUsers(decoded)
            
            try self.cacheUsers(decoded)
        }catch{
            self._presenter?.didFetchUsers(error)
        }
    }
    
    // MARK: - Cache
    
    func cacheUsers(_ users: [ShowUser]) throws {
        
        let data = try JSONEncoder().encode(users)
        let string = String.init(data: data, encoding: .utf8) ?? ""
        let cache = NSCache<NSString, NSString>.init()
        
        cache.setObject(NSString.init(string: string), forKey: "CachedUsers")

    }
    
    func getCacheUsers() throws -> [ShowUser]? {
        
        let cache = NSCache<NSString, NSString>.init()
        
        guard let string = cache.object(forKey: "CachedObject") else { return [] }
        guard let data = String(string).data(using: .utf8) else { return [] }
         
        return try JSONDecoder().decode([ShowUser].self, from: data)
    }
}
