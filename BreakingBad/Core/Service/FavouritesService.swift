//
//  FavouritesService.swift
//  BreakingBad
//
//  Created by Wandeep Basra on 21/11/2022.
//

import SwiftUI

class FavouritesService: ObservableObject {
    private var characterIds: Set<Int>
    private let saveKey = "Favourites"

    init() {
        if let favIds = UserDefaults.standard.object(forKey: saveKey) as? [Int] {
            characterIds = Set(favIds)
        } else {
            characterIds = []
        }
    }

    func contains(_ character: Character) -> Bool {
        characterIds.contains(character.id)
    }
    
    func toggle(_ character: Character) {
        if contains(character) {
            remove(character)
        } else {
            add(character)
        }
    }
}

private extension FavouritesService {
    func add(_ character: Character) {
        objectWillChange.send()
        characterIds.insert(character.id)
        save()
    }

    func remove(_ character: Character) {
        objectWillChange.send()
        characterIds.remove(character.id)
        save()
    }

    func save() {
        UserDefaults.standard.set(Array(characterIds), forKey: saveKey)
    }
}
