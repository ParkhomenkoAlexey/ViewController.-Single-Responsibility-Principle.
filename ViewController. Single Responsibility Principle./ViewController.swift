//
//  ViewController.swift
//  ViewController. Single Responsibility Principle.
//
//  Created by Алексей Пархоменко on 22/05/2019.
//  Copyright © 2019 Алексей Пархоменко. All rights reserved.
//

import UIKit

struct Country: Decodable {
    
    var Id: String
    var Time: String
    var Name: String
    var Image: String?
}

class ViewController: UIViewController {
    
    let urlString = "https://raw.githubusercontent.com/Softex-Group/task-mobile/master/test.json"

    // элементы пользовательского интерфейса
    @IBOutlet weak var myTextField: UITextField!
    @IBOutlet weak var textLabel: UILabel!
    @IBOutlet weak var saveButton: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        saveButton.layer.cornerRadius = saveButton.frame.width / 2
        dataFetcher()
    }
    
    
    
    // MARK: - Бизнес логика
    // логика сохранения имени
    func changeName() {
        guard let name = textLabel.text, name != "" else { showAlert()
            return
        }
        print("Ваше имя сохранено: \(name)")
        saveNameInCache(name: name)
    }
    
    // MARK: - Хранение данных
    
    func saveNameInCache(name: String) {
        
    }
    
    func getNameFromCache() -> String {
        return "some name"
    }
    
    // MARK: - Работа с сетью
    
    // декодируем полученные JSON данные в модель данных
    func dataFetcher() {
        request { (data, error) in
            let decoder = JSONDecoder()
            guard let data = data else { return }
            let response = try? decoder.decode([Country].self, from: data)
            print(response)
        }
    }
    
    // построение запроса данных по URL
    func request(completion: @escaping (Data?, Error?) -> Void) {
        guard let url = URL(string: urlString) else { return }
        let request = URLRequest(url: url)
        let task = URLSession.shared.dataTask(with: request, completionHandler: { (data, response, error) in
            DispatchQueue.main.async {
                completion(data, error)
            }
        })
        task.resume()
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

