//
//  QuotesViewModel.swift
//  BreakingBad
//
//  Created by Wandeep Basra on 21/11/2022.
//

import Foundation

@MainActor
final class QuotesViewModel: ObservableObject {

    let webService: WebServiceProtocol

    @Published var quotes: [Quote] = []

    init(webService: WebServiceProtocol = WebService()) {
        self.webService = webService
    }
    
    func fetchQuotes(for author: String) async {
        let result = await webService.fetch(endpoint: .quotes(author), responseType: [Quote].self)
        
        switch (result) {
        case .success(let quotes):
            self.quotes = quotes
        case .failure(let error):
            print("fetchQuotes error: \(error)")
        }
    }
}
