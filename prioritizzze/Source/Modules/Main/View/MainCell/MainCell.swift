//
//  MainCell.swift
//  prioritizzze
//
//  Created by Амир Нуриев on 30/04/2018.
//  Copyright © 2018 Amir Nuriev. All rights reserved.
//

import UIKit

final class MainCell: UITableViewCell {

    @IBOutlet private weak var titleLabel: UILabel!
    
    @IBOutlet private weak var descriptionLabel: UILabel!

    func configure(title: String, description: String) {
        titleLabel.text = title
        descriptionLabel.text = description
    }
}
