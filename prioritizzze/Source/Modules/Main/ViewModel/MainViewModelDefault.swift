//
//  MainViewModelDefault.swift
//  prioritizzze
//
//  Created by Амир Нуриев on 28.04.2018.
//  Copyright © 2018 Amir Nuriev. All rights reserved.
//

import ReactiveCocoa
import ReactiveSwift

final class MainViewModelDefault: MainViewModel {
    let entities: Property<[Entity]>
    private let mutableEntities: MutableProperty<[Entity]>
    
    init() {
        mutableEntities = MutableProperty(Entity.makeFakeEntities())
        entities = Property(capturing: mutableEntities)
    }
    
    func refreshData() {
        mutableEntities.value[0] = Entity(title: "Обновленный энтити вухуху!!", description: "Прювейт!")
    }
}

