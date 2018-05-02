//
//  MainCell.swift
//  prioritizzze
//
//  Created by Амир Нуриев on 30/04/2018.
//  Copyright © 2018 Amir Nuriev. All rights reserved.
//

import UIKit

final class MainCell: UITableViewCell {
    
    public var viewModel: MainCellModel? {
        didSet {
            guard let viewModel = viewModel else { return }
            viewModel
                .entity
                .producer
                .startWithValues { [weak self] entity in
                    self?.configure(
                        title: entity.title,
                        description: entity.description
                    )
            }
        }
    }

    @IBOutlet private weak var titleLabel: UILabel!
    
    @IBOutlet private weak var descriptionLabel: UILabel!

    private func configure(title: String, description: String?) {
        titleLabel.text = title
        descriptionLabel.text = description
    }
}
