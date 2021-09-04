//
//  BaseViewModel.swift
//  eLock
//
//  Created by Tarun Singh on 9/3/21.
//  Copyright © 2021 Tarun Singh. All rights reserved.
//

import UIKit

enum AlertType {
    case normal
    case warning
    case error
    case success
    case custom
}

class BaseViewModel: NSObject {

    var isLoading: Bool = false {
        didSet {
            self.updateLoadingStatus?()
        }
    }
    
    var alertMessage: String? {
        didSet {
            self.showAlertClosure?(.success)
        }
    }
    
    var errorMessage: String? {
        didSet {
            self.showAlertClosure?(.error)
        }
    }
    
    var isSuccess:Bool? {
        didSet {
            if isSuccess ?? false {
                self.redirectControllerClosure?()
            }
        }
    }
    
    var isFailed:Bool? {
        didSet {
            self.showAlertClosure?(.error)
        }
    }
    
    var showAlertClosure: ((_ type: AlertType)->())?
    var updateLoadingStatus: (()->())?
    var reloadListViewClosure: (()->())?
    var redirectControllerClosure: (()->())?
    
}
