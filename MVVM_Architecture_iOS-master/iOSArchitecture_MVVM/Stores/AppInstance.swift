//
//  AppInstance.swift
//
//
//  Created by Tarun Singh on 9/3/21.
//  Copyright © 2021 Tarun Singh. All rights reserved.
//
// Use this class for storing shared instances

import Foundation

class AppInstance: NSObject {
   
    static let shared = AppInstance()
//    var user:User?
    var authToken:String?
    
    override init() {
        super.init()
    }
}
