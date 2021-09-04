//
//  VideoCell.swift
//  iOSArchitecture_MVVM
//
//  Created by Tarun Singh on 9/3/21.
//  Copyright © 2021 Tarun Singh. All rights reserved.
//

import UIKit
import AVKit
import GSPlayer

class VideoCell: UITableViewCell {

//    @IBOutlet weak var videoPlayer: PlayerView?
    @IBOutlet weak var playerView: VideoPlayerView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func setVideoData(data: ResData) {
        
        playerView.contentMode = .scaleAspectFill
        playerView.play(for: URL(string: data.data!)!)
        
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
