//
//  WebViewController.swift
//  iOSArchitecture_MVVM
//
//  Created by Tarun Singh on 9/4/21.
//  Copyright © 2021 Tarun Singh. All rights reserved.
//

import UIKit
import WebKit

class WebViewController: BaseViewController {

    @IBOutlet weak var webview: WKWebView?
    var urlString: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.hideNavigationBar(false, animated: false)
        
        self.navigationController?.navigationBar.isHidden = false

        self.webview?.load(NSURLRequest(url: NSURL(string: urlString ?? "")! as URL) as URLRequest)
    }
    

}
