//
//  APIConstant.swift
//  iOSArchitecture_MVVM
//
//  Created by Tarun Singh on 9/3/21.
//  Copyright © 2021 Tarun Singh. All rights reserved.
//

import UIKit

enum Config {
    
    #if DEVELOPMENT
    static let BASE_URL: String = "https://jsonkeeper.com/b/OQWM"
    #else
    static let BASE_URL: String = "https://jsonkeeper.com/b/OQWM"
    #endif
    
    
    
    static let SomeOtherURL: String = "https://jsonkeeper.com/b/OQWM"
    
    
}

