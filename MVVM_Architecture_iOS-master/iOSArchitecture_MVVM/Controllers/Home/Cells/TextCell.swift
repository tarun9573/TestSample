//
//  TextCell.swift
//  iOSArchitecture_MVVM
//
//  Created by Tarun Singh on 9/3/21.
//  Copyright © 2021 Tarun Singh. All rights reserved.
//

import UIKit

class TextCell: UITableViewCell {

    @IBOutlet weak var lblText: UILabel?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func setData(_ data: ResData) {
        self.lblText?.text = data.data
    }
    

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
