//
//  HomeVC.swift
//  iOSArchitecture_MVVM
//
//  Created by Tarun Singh on 9/3/21.
//  Copyright © 2021 Tarun Singh. All rights reserved.
//

import UIKit
import AVKit
import GSPlayer

class HomeVC: BaseViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet weak var dashboardList: UITableView?
    
    // Lazy Init ViewMOdel class
    lazy var viewModel: HomeVM = {
        let vm = HomeVM(userService: UserService())
        self.baseVwModel = vm
        return vm
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        setupUI()
        setupClosure()
        self.viewModel.getDashboardData()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.hideNavigationBar(true, animated: false)
    }
    
    func setupUI() {
        self.hideNavigationBar(true, animated: false)
        self.dashboardList?.tableFooterView = UIView()
    }
    
    func setupClosure() {
        
        viewModel.redirectControllerClosure = {[weak self] () in
            DispatchQueue.main.async {
                self?.dashboardList?.reloadData()
                print(self?.viewModel.dashBoardData?.data?.count ?? 0)
                print(self?.viewModel.dashBoardData?.data?.last?.item_type ?? "")
                
                // Now configurin Cells to display video and Images and Links
                
            }
        }
    }
    
    //MARK: UITableView Datasource and Delegate
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.viewModel.dashBoardData?.data?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
//        return UITableView.automaticDimension
        guard let dataModel = self.viewModel.dashBoardData?.data?[indexPath.row] else { return 0 }
        if dataModel.item_type == "image" {
            return 270
        } else if dataModel.item_type == "video" {
            return 220
        }
        return UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let dataModel = self.viewModel.dashBoardData?.data?[indexPath.row] else { return UITableViewCell() }
        if dataModel.item_type == "image" {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: ImageCell.className) as? ImageCell else { return UITableViewCell() }
            cell.setData(dataModel)
            return cell
        }
        if dataModel.item_type == "video" {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: VideoCell.className) as? VideoCell else { return UITableViewCell() }
            cell.setVideoData(data: dataModel)
            return cell
        }
        if dataModel.item_type == "text" {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: TextCell.className) as? TextCell else { return UITableViewCell() }
            cell.setData(dataModel)
            return cell
        }
        guard let cell = tableView.dequeueReusableCell(withIdentifier: URLCell.className) as? URLCell else { return UITableViewCell() }
        cell.setURLData(dataModel)
        cell.delegate = self
        return cell
    }
    
}


extension HomeVC: URLCellDelegate {
    func urlTapped(_ urlString: String) {
        let controller = self.storyboard?.instantiateViewController(withIdentifier: WebViewController.className) as? WebViewController
        controller?.urlString = urlString
        self.navigationController?.pushViewController(controller ?? UIViewController(), animated: true)
        
    }
    
    
}
