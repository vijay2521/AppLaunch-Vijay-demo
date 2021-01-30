//
//  FeatureSectionCell.swift
//  AppLaunch-Test
//
//  Created by Vijay's Mac on 30/01/21.
//  Copyright © 2021 Vijay's Mac. All rights reserved.
//

import UIKit

class FeatureSectionCell: UITableViewCell {

    @IBOutlet weak var featureSectionCollectionView: UICollectionView!
    override func awakeFromNib() {
        super.awakeFromNib()
        self.featureSectionCollectionView.backgroundColor = UIColor.clear
        self.backgroundColor = UIColor.clear
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        self.selectionStyle = .none
    }
    
}
