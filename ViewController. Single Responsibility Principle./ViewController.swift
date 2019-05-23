//
//  ViewController.swift
//  ViewController. Single Responsibility Principle.
//
//  Created by Алексей Пархоменко on 22/05/2019.
//  Copyright © 2019 Алексей Пархоменко. All rights reserved.
//

import UIKit



class ViewController: UIViewController {
        
    // зависимости
    var fetcher: DataFetcher = NetworkDataFetcher()
    var dataStore: DataStore = DataStore()

    // элементы пользовательского интерфейса
    @IBOutlet weak var myTextField: UITextField!
    @IBOutlet weak var textLabel: UILabel!
    @IBOutlet weak var saveButton: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        saveButton.layer.cornerRadius = saveButton.frame.width / 2
        fetcher.getCountry { (countries) in
            print(countries?.first?.Name)
        }
    }
    
    // MARK: - Бизнес логика
    
    // логика сохранения имени
    func changeName() {
        guard let name = textLabel.text, name != "" else { showAlert()
            return
        }
        
        dataStore.saveNameInCache(name: name)
//        saveNameInCache(name: name)
    }
    
    //MARK: - Пользовательский интерфейс
    
    // отображение интерфейса
    func showAlert() {
        let alert = UIAlertController(title: "WARNING", message: "Ваше имя не может быть пустым", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Понятно", style: UIAlertAction.Style.default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
    
    // Взаимодействие пользователя с интерфейсом
    @IBAction func changeLabel(_ sender: Any) {
        textLabel.text = myTextField.text
    }
    
    @IBAction func saveButtonTapped(_ sender: Any) {
        changeName()
    }
    
}

