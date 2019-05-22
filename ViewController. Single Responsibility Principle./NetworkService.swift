//
//  NetworkService.swift
//  ViewController. Single Responsibility Principle.
//
//  Created by Алексей Пархоменко on 22/05/2019.
//  Copyright © 2019 Алексей Пархоменко. All rights reserved.
//

import UIKit

class NetworkService {
    
    // декодируем полученные JSON данные в модель данных
    func dataFetcher(urlString: String) {
        request(urlString: urlString) { (data, error) in
            let decoder = JSONDecoder()
            guard let data = data else { return }
            let response = try? decoder.decode([Country].self, from: data)
            print(response)
        }
    }
    
    // построение запроса данных по URL
    func request(urlString: String, completion: @escaping (Data?, Error?) -> Void) {
        guard let url = URL(string: urlString) else { return }
        let request = URLRequest(url: url)
        let task = URLSession.shared.dataTask(with: request, completionHandler: { (data, response, error) in
            DispatchQueue.main.async {
                completion(data, error)
            }
        })
        task.resume()
    }
}
