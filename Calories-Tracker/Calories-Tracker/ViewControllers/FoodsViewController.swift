//
//  ViewController.swift
//  Calories-Tracker
//
//  Created by Denislav Todorov on 23.11.22.
//

import UIKit
import CoreData

class FoodsViewController: UIViewController, UISearchBarDelegate, UISearchDisplayDelegate {
    
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var tableView: UITableView!
    

    var foods = [Food]()
    var searchedFoods = [Food]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let fetchRequest: NSFetchRequest<Food> = Food.fetchRequest()
        
        let weakSelf = self
        
        do{
          let foods = try PersistenceService.context.fetch(fetchRequest)
          weakSelf.foods = foods
            weakSelf.tableView.reloadData()
        } catch {
            
        }
        
        searchBar.delegate=self
        
    }
    
    
    @IBAction func onPlusTapped() {
        let alert = UIAlertController(title: "Add Food",
                                      message: nil,
                                      preferredStyle: .alert)
        
        alert.addTextField{ (textField) in
            textField.placeholder = "Food Name"
        }
        alert.addTextField{ (textField) in
            textField.placeholder = "Calories Per 100g"
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
            let calories100g = Int32((alert.textFields?[1].text)!) ?? 0
            let fat = Int32((alert.textFields?[2].text)!) ?? 0
            let carbohydrate = Int32((alert.textFields?[3].text)!) ?? 0
            let protein = Int32((alert.textFields?[4].text)!) ?? 0
            
            let food = Food(context: PersistenceService.context)
            
            food.name = name!
            food.coloriesPer100Grams = calories100g
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
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        if !searchText.isEmpty {
            var predicate: NSPredicate = NSPredicate()
            predicate = NSPredicate(format: "name contains[c] '\(searchText)'")
            //guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else { return }
            let managedObjectContext = PersistenceService.context
            let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName:"Food")
            fetchRequest.predicate = predicate
            do {
                foods = try managedObjectContext.fetch(fetchRequest) as! [Food]
                
            } catch let error as NSError {
                print("Could not fetch. \(error)")
            }
        }
        tableView.reloadData()
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
        cell.textLabel?.text = "\(foods[indexPath.row].name!)   -   \(String(foods[indexPath.row].coloriesPer100Grams))calories"
        //cell.detailTextLabel?.text = String(foods[indexPath.row].coloriesPer100Grams)
        cell.detailTextLabel?.text = "C: \(String(foods[indexPath.row].macroCarb))  P: \(String(foods[indexPath.row].macroProtein))  F: \(String(foods[indexPath.row].macroFat))"
//        cell.detailTextLabel?.text = String(foods[indexPath.row].macroCarb)
//        cell.detailTextLabel?.text = String(foods[indexPath.row].macroProtein)
        return cell
    }
}
