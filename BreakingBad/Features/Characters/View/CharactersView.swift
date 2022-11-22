//
//  CharactersView.swift
//  BreakingBad
//
//  Created by Wandeep Basra on 21/11/2022.
//

import SwiftUI

struct CharactersView {
    @StateObject var viewModel = CharactersViewModel()
    
    @EnvironmentObject var favouritesService: FavouritesService
    
    private func isFavourited(_ character: Character) -> Bool {
        favouritesService.contains(character)
    }
    
    private func toggleFavourite(_ character: Character) {
        favouritesService.toggle(character)
    }
}

extension CharactersView: View {
    var body: some View {
        NavigationStack {
            if viewModel.characters.isEmpty {
                ProgressView()
            } else {
                List(viewModel.characters) { character in
                    NavigationLink(value: character) {
                        CharacterRow(character: character,
                                     isFavourited: isFavourited(character),
                                     onToggleFavourite: toggleFavourite(_:))
                    }
                }
                .listStyle(.plain)
                .navigationDestination(for: Character.self) { character in
                    CharacterDetailView.init(character: character)
                }
                .navigationTitle("Characters")
            }
        }
        .padding(4)
        .task {
            await viewModel.fetchCharacters()
        }
    }
}

struct CharactersView_Previews: PreviewProvider {
    static var previews: some View {
        CharactersView()
            .environmentObject(FavouritesService())
    }
}
