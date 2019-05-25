//
//  DataFetcherService.swift
//  ViewController. Single Responsibility Principle.
//
//  Created by Алексей Пархоменко on 25/05/2019.
//  Copyright © 2019 Алексей Пархоменко. All rights reserved.
//

import Foundation

protocol FetcherService {
    func fetchCountry(completion: @escaping ([Country]?) -> Void)
    func fetchLocalCountry(completion: @escaping ([Country]?) -> Void)
}

class DataFetcherService: FetcherService {

    var networkDataFetcher: DataFetcher!
    var localDataFetcher: DataFetcher!
    
    init(networkDataFetcher: DataFetcher = NetworkDataFetcher(), localDataFetcher: DataFetcher = LocalDataFetcher()) {
        self.networkDataFetcher = networkDataFetcher
        self.localDataFetcher = localDataFetcher
    }
    
    func fetchCountry(completion: @escaping ([Country]?) -> Void) {
        let urlString = "https://raw.githubusercontent.com/Softex-Group/task-mobile/master/test.json"
        networkDataFetcher.fetchGenericJSONData(urlString: urlString, response: completion)
    }
    
    func fetchLocalCountry(completion: @escaping ([Country]?) -> Void) {
        guard let path = Bundle.main.path(forResource: "usersAPI", ofType: "txt") else { return }
        localDataFetcher.fetchGenericJSONData(urlString: path, response: completion)
    }  
}
