//
//  SongListCell.swift
//  AppLaunch-Test
//
//  Created by Vijay's Mac on 30/01/21.
//  Copyright © 2021 Vijay's Mac. All rights reserved.
//

import UIKit

class SongListCell: UITableViewCell {

    
    @IBOutlet weak var songPosterImage: UIImageView!
    @IBOutlet weak var songName: UILabel!
    @IBOutlet weak var castName: UILabel!
    @IBOutlet weak var addToPlayListButton: UIButton!
    @IBOutlet weak var moreButton: UIButton!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.songName.textColor = .white
        self.castName.textColor = .lightGray
        self.addToPlayListButton.tintColor = .white
        self.moreButton.tintColor = .white
        self.songPosterImage.contentMode = .scaleAspectFill
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        self.selectionStyle = .none
        // Configure the view for the selected state
    }
    override func layoutIfNeeded() {
        self.songPosterImage.layer.cornerRadius = 10.0
    }
    
}
