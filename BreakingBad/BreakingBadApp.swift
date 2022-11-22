//
//  BreakingBadApp.swift
//  BreakingBad
//
//  Created by Wandeep Basra on 21/11/2022.
//

import SwiftUI

@main
struct BreakingBadApp: App {
    var body: some Scene {
        WindowGroup {
            CharactersView()
                .environmentObject(FavouritesService())
        }
    }
}
