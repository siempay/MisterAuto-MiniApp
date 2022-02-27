//
//  EnumNetworkRoutes.swift
//  MisterAuto-MiniApp
//
//  Created by Brahim ELMSSILHA on 2/27/22.
//

import Foundation


enum EnumNetworkRoutes {
    case allUsers
    case tasksByUser(Int64)

    private var path: String {
      
        switch self {
        case .allUsers: return "https://jsonplaceholder.typicode.com/users"
        case .tasksByUser(let id): return "https://jsonplaceholder.typicode.com/todos?userId=\(id)"

        }
    }
}

extension EnumNetworkRoutes {
    
    var url: URL! {
        
        return URL.init(string: self.path)
    }
}
