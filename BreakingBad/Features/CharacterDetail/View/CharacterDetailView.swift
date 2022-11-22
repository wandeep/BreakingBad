//
//  CharacterDetailView.swift
//  BreakingBad
//
//  Created by Wandeep Basra on 21/11/2022.
//

import SwiftUI

struct CharacterDetailView {
    @StateObject var viewModel = QuotesViewModel()

    @EnvironmentObject var favouritesService: FavouritesService
    
    let character: Character
    
    private var isFavourited: Bool {
        favouritesService.contains(character)
    }
    
    private func toggleFavourite(_ character: Character) {
        favouritesService.toggle(character)
    }
}

extension CharacterDetailView: View {
    var body: some View {
        VStack(spacing: 10) {
            image
            favourite
            otherInfo
            quotes
        }
        .navigationTitle(character.name)
        .task {
            await viewModel.fetchQuotes(for: character.name)
        }
    }
}

private extension CharacterDetailView {
    var image: some View {
        AsyncImage(url: URL(string: character.imageUrl)) { image in
            image
                .resizable()
                .aspectRatio(contentMode: .fit)
                .cornerRadius(15)
        } placeholder: {
            ProgressView()
        }
        .padding()
        .frame(width: 350, height: 350)
    }
    
    var favourite: some View {
        Button {
            toggleFavourite(character)
        } label: {
            Image(systemName: isFavourited ? "heart.fill" : "heart")
                .resizable()
                .foregroundColor(.red)
        }
        .frame(width: 24, height: 24)
    }
    
    var otherInfo: some View {
        VStack(spacing: 8) {
            Label(character.portrayed, systemImage: "theatermasks.circle")
            Label(character.birthday, systemImage: "birthday.cake")
            Label(character.nickname, systemImage: "person.circle")
        }
        .font(.headline)
    }
    
    var quotes: some View {
        List {
            Section(header: Text("Quotes")) {
                if viewModel.quotes.isEmpty {
                    Text("No quotes")
                } else {
                    ForEach(viewModel.quotes) { quote in
                        Text(quote.quote)
                    }
                }
            }
        }
        .listStyle(.plain)
    }
}

struct CharacterDetailView_Previews: PreviewProvider {
    static var previews: some View {
        CharacterDetailView(character: Character.sample)
            .environmentObject(FavouritesService())
    }
}
