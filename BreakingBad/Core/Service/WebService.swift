//
//  WebService.swift
//  BreakingBad
//
//  Created by Wandeep Basra on 21/11/2022.
//

import Foundation

enum WebServiceError: Error {
    case decodingError
    case fetchError
}

protocol WebServiceProtocol {
    func fetch<T: Decodable> (endpoint: Endpoint, responseType: T.Type) async -> Result<T, WebServiceError>
}

final class WebService: WebServiceProtocol {
    private let urlSession: URLSession
    
    required init(urlSession: URLSession = URLSession.shared) {
        self.urlSession = urlSession
    }
    
    func fetch<T: Decodable> (endpoint: Endpoint, responseType: T.Type) async -> Result<T, WebServiceError> {
        do {
            let (data, _) = try await urlSession.data(from: endpoint.url)
            if let decodedResponse = try? JSONDecoder().decode(responseType, from: data) {
                return .success(decodedResponse)
            } else {
                return .failure(.decodingError)
            }
        } catch {
            return .failure(.fetchError)
        }
    }
    
}
