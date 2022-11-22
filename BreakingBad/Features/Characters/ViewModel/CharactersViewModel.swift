//
//  CharactersViewModel.swift
//  BreakingBad
//
//  Created by Wandeep Basra on 21/11/2022.
//

import Foundation

@MainActor
final class CharactersViewModel: ObservableObject {

    let webService: WebServiceProtocol

    @Published var characters: [Character] = []

    init(webService: WebServiceProtocol = WebService()) {
        self.webService = webService
    }
    
    func fetchCharacters() async {
        let result = await webService.fetch(endpoint: .characters, responseType: [Character].self)
        
        switch (result) {
        case .success(let characters):
            self.characters = characters
        case .failure(let error):
            print("fetchCharacters error: \(error)")
        }
    }
}
