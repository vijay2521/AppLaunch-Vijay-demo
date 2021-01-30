//
//  EachFeatureItemCell.swift
//  AppLaunch-Test
//
//  Created by Vijay's Mac on 30/01/21.
//  Copyright © 2021 Vijay's Mac. All rights reserved.
//

import UIKit

class EachFeatureItemCell: UICollectionViewCell {

    @IBOutlet weak var featuredSectionImage: UIImageView!
    @IBOutlet weak var contentNameLabel: UILabel!
    @IBOutlet weak var castLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.featuredSectionImage.contentMode = .scaleAspectFill
        featuredSectionImage.layer.cornerRadius = 10.0
        featuredSectionImage.clipsToBounds = true
        contentNameLabel.textColor = .white
        castLabel.textColor = .gray
    }

    
}
