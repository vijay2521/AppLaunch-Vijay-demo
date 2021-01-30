//
//  BannerTableViewCell.swift
//  AppLaunch-Test
//
//  Created by Vijay's Mac on 30/01/21.
//  Copyright © 2021 Vijay's Mac. All rights reserved.
//

import UIKit

class BannerTableViewCell: UITableViewCell {

    @IBOutlet weak var bannerView: AACarousel!
    override func awakeFromNib() {
        super.awakeFromNib()
        self.bannerView.backgroundColor = UIColor.black
        self.contentView.backgroundColor = .black
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
