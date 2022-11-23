//
//  ViewController.swift
//  Calories-Tracker
//
//  Created by Denislav Todorov on 23.11.22.
//

import UIKit

class FoodsViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!

    var foods = [Food]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func onPlusTapped() {
        let alert = UIAlertController(title: "Add Food",
                                      message: nil,
                                      preferredStyle: .alert)
        
        alert.addTextField{ (textField) in
            textField.placeholder = "Food Name"
        }
        alert.addTextField{ (textField) in
            textField.placeholder = "Calories per 100g"
            textField.keyboardType = .numberPad
        }
        alert.addTextField{ (textField) in
            textField.placeholder = "Fat"
            textField.keyboardType = .numberPad
        }
        alert.addTextField{ (textField) in
            textField.placeholder = "Carbohydrate"
            textField.keyboardType = .numberPad
        }
        alert.addTextField{ (textField) in
            textField.placeholder = "Protein"
            textField.keyboardType = .numberPad
        }
        let action = UIAlertAction(title: "Add", style: .default) { (_) in
            let name = alert.textFields?.first!.text
            let caloriesPer100Grams = alert.textFields?.index(after: 0)
            let fat = alert.textFields?.index(after: 1)
            let carbohydrate = alert.textFields?.index(after: 2)
            let protein = alert.textFields?.last!
            print(name)
            print(caloriesPer100Grams)
            print(fat)
            print(carbohydrate)
            print(protein)
        }
        
        alert.addAction(action)
        present(alert, animated: true)
    }
    
    @IBAction func cancelTapped() {
        
    }

}

extension FoodsViewController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return foods.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .subtitle, reuseIdentifier: nil)
        cell.textLabel?.text = ""
        cell.detailTextLabel?.text = ""
        return cell
    }
}
