//
//  DataStore.swift
//  ViewController. Single Responsibility Principle.
//
//  Created by Алексей Пархоменко on 22/05/2019.
//  Copyright © 2019 Алексей Пархоменко. All rights reserved.
//

import UIKit

class DataStore {
    
    func saveNameInCache(name: String) {
        print("Ваше имя сохранено: \(name)")
    }
    
    func getNameFromCache() -> String {
        return "some name"
    }
}
