//
//  MainCell.swift
//  prioritizzze
//
//  Created by Амир Нуриев on 30/04/2018.
//  Copyright © 2018 Amir Nuriev. All rights reserved.
//

import UIKit
import ReactiveSwift
import Result

final class MainCell: UITableViewCell {
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        signal.observeValues { [weak self] entity in
            self?.setup(entity)
        }
    }
    
    private let (signal, observer) = Signal<Entity?, NoError>.pipe()
    
    public var updater: Signal<Entity?, NoError>.Observer {
        return self.observer
    }

    @IBOutlet private weak var titleLabel: UILabel!
    
    @IBOutlet private weak var descriptionLabel: UILabel!
    
    private func setup(_ entity: Entity?) {
        guard let entity = entity else { return }
        titleLabel.text = entity.title
        descriptionLabel.text = entity.description
    }
}
