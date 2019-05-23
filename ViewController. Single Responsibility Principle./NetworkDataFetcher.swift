//
//  NetworkDataFetcher.swift
//  ViewController. Single Responsibility Principle.
//
//  Created by Алексей Пархоменко on 23/05/2019.
//  Copyright © 2019 Алексей Пархоменко. All rights reserved.
//

import Foundation

class NetworkDataFetcher {
    
    let networkService = NetworkService()
    
    // декодируем полученные JSON данные в модель данных
    func fetchCountry(urlString: String, response: @escaping ([Country]?) -> Void) {
        
        networkService.request(urlString: urlString) { (data, error) in
            guard let data = data else { return }
            let decoded = self.decodeJSON(type: [Country].self, from: data)
            response(decoded)
        }
    }
    
    private func decodeJSON<T: Decodable>(type: T.Type, from: Data?) -> T? {
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        guard let data = from, let response = try? decoder.decode(type.self, from: data) else { return nil }
        return response
    }
    
    
}
