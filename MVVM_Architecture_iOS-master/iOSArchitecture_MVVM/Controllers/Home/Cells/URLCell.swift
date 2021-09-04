//
//  URLCell.swift
//  iOSArchitecture_MVVM
//
//  Created by Tarun Singh on 9/3/21.
//  Copyright © 2021 Tarun Singh. All rights reserved.
//

import UIKit
import ActiveLabel

protocol URLCellDelegate {
    func urlTapped(_ urlString: String)
}

class URLCell: UITableViewCell {

    @IBOutlet weak var lblURL: ActiveLabel?
    var delegate: URLCellDelegate?
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    func setURLData(_ data: ResData) {

        self.lblURL?.customize { label in
            label.text = data.data
            label.numberOfLines = 0
            label.lineSpacing = 4
            
            label.URLColor = UIColor.blue
            label.URLSelectedColor = UIColor.blue
            label.handleURLTap { self.urlTapped($0.absoluteString) }
        }
    }
    
    func urlTapped(_ url: String) {
        print(url)
        self.delegate?.urlTapped(url)
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
