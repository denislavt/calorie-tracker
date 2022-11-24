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
            let name = alert.textFields?[0].text
            let calories100g = Int((alert.textFields?[1].text)!) ?? 0
            let fat = Int((alert.textFields?[2].text)!) ?? 0
            let carbohydrate = Int((alert.textFields?[3].text)!) ?? 0
            let protein = Int((alert.textFields?[4].text)!) ?? 0
            
            let food = Food(context: PersistenceService.context)
            
            food.name = name!
            food.calories100g = calories100g
            food.macroFat = fat
            food.macroCarb = carbohydrate
            food.macroProtein = protein
            
            PersistenceService.saveContext()
            
            self.foods.append(food)
            self.tableView.reloadData()
            
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
        cell.textLabel?.text = foods[indexPath.row].name
        cell.detailTextLabel?.text = String(foods[indexPath.row].calories100g)
        cell.detailTextLabel?.text = String(foods[indexPath.row].macroFat)
        cell.detailTextLabel?.text = String(foods[indexPath.row].macroCarb)
        cell.detailTextLabel?.text = String(foods[indexPath.row].macroProtein)
        return cell
    }
}
