//
//  MainModel.swift
//  prioritizzze
//
//  Created by Амир Нуриев on 28.04.2018.
//  Copyright © 2018 Amir Nuriev. All rights reserved.
//

struct Entity: Equatable {
    let title: String
    let description: String?
}

extension Entity {
    static func makeFakeEntities() -> [Entity] {
        let entity1 = Entity(
            title: "eat healthy",
            description: "eat oatmeal and vegies and stuff"
        )
        let entity2 = Entity(title: "sleep more", description: nil)
        let entity3 = Entity(
            title: "develop an application",
            description: "start developing an app for github portfolio and other funzies"
        )
        
        return [entity1, entity2, entity3]
    }
}
