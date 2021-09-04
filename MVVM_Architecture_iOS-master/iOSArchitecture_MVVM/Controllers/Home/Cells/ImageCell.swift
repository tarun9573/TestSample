//
//  ImageCell.swift
//  iOSArchitecture_MVVM
//
//  Created by Tarun Singh on 9/3/21.
//  Copyright © 2021 Tarun Singh. All rights reserved.
//

import UIKit
import SDWebImage

class ImageCell: UITableViewCell {

    @IBOutlet weak var imgView: UIImageView?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func setData(_ data: ResData)  {
        self.imgView?.sd_setImage(with: URL(string: data.data ?? ""), placeholderImage: nil)
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
