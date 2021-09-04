//
//  HomeVM.swift
//  iOSArchitecture_MVVM
//
//  Created by Tarun Singh on 9/3/21.
//  Copyright © 2021 Tarun Singh. All rights reserved.
//

import UIKit

class HomeVM: BaseViewModel {

    
    var userService: UserServiceProtocol
    var dashBoardData: BaseData?
    
    // Putting Dependency Injection by passing the service object
    init(userService: UserServiceProtocol) {
        self.userService = userService
    }
    
    func getDashboardData() {
        userService.fetchDashBoardData { (result) in
            // Calling API and Loader will be shown untill api fininshed loading
            self.isLoading = true
            switch result {
            case .Success(let data):
                //calling closure here which is defined in Baseview model class
                print(data)
                guard let baseData = data as? BaseData else { return }
                self.dashBoardData = baseData
                self.isSuccess = true
            case .Error(let messageString):
                self.isSuccess = false
                self.errorMessage = messageString
            }
        }
    }
    
    
    
}
