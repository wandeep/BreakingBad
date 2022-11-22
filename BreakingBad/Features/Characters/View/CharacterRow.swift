//
//  CharacterRow.swift
//  BreakingBad
//
//  Created by Wandeep Basra on 21/11/2022.
//

import SwiftUI

struct CharacterRow {
    let character: Character
    let isFavourited: Bool
    
    var onToggleFavourite: (Character) -> Void
}

extension CharacterRow: View {
    var body: some View {
        HStack {
            Text(character.name)
                .swipeActions(allowsFullSwipe: false) {
                    Button {
                        onToggleFavourite(character)
                    } label: {
                        Label("Favourite", systemImage: "heart.fill")
                    }
                }
            
            if isFavourited {
                Image(systemName: "heart.fill")
                    .foregroundColor(.red)
            }
        }
        .font(.headline)
    }
}

struct CharacterRow_Previews: PreviewProvider {
    static var previews: some View {
        CharacterRow(character: Character.sample, isFavourited: true, onToggleFavourite: {_ in })
    }
}
