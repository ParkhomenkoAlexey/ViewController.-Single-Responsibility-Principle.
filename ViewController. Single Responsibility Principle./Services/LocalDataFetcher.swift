//
//  LocalDataFetcher.swift
//  ViewController. Single Responsibility Principle.
//
//  Created by Алексей Пархоменко on 25/05/2019.
//  Copyright © 2019 Алексей Пархоменко. All rights reserved.
//

import Foundation

class LocalDataFetcher: NetworkDataFetcher {
    
    override func fetchGenericJSONData<T>(urlString: String, response: @escaping (T?) -> Void) where T : Decodable {
        let url = URL(fileURLWithPath: urlString)

        let data = try? Data(contentsOf: url)
        let decoded = self.decodeJSON(type: T.self, from: data)
        response(decoded)
    }
}
