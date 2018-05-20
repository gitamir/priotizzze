//
//  MainModule.swift
//  prioritizzze
//
//  Created by Амир Нуриев on 28.04.2018.
//  Copyright © 2018 Amir Nuriev. All rights reserved.
//

import ReactiveCocoa
import ReactiveSwift

protocol MainViewModel: class {
    var entities: Property<[Entity]> { get }
    func refreshData()
}

protocol MainCellModel: class {
    var entity: Property<Entity> { get }
}
