//
//  UserService.swift
//  iOSArchitecture_MVVM
//
//  Created by Tarun Singh on 9/3/21.
//  Copyright © 2021 Tarun Singh. All rights reserved.
//

import UIKit
import Foundation

protocol UserServiceProtocol {
    func fetchDashBoardData(completion: @escaping (Result<Any>) -> Void)
}

public class UserService: APIService, UserServiceProtocol {
    
    
    func fetchDashBoardData(completion: @escaping (Result<Any>) -> Void) {
        // API Implementation will go here
        
//        let param = [String: Any]()
        super.startService(with: .GET, path: Config.BASE_URL, parameters: nil, files: [], modelType:BaseData.self) { (result) in
            switch result {
            case .Success(let data):
                completion(.Success(data))
            case .Error(let messageString):
                completion(.Error(messageString))
                
            }
        }
        
    }
    
}

