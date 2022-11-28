//
//  CalendarFoodViewController.swift
//  Calories-Tracker
//
//  Created by Denislav Todorov on 24.11.22.
//

import UIKit

class CalendarFoodViewController: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    
    
    var todayFoods = [Food]()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
        
        let vc = FoodsViewController(nibName: "FoodsViewController", bundle: nil)
        vc.calendarFoodViewController = self
        
        todayFoods = vc.foods
        
        
        
        
        // Do any additional setup after loading the view.
    }
    

    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}


extension CalendarFoodViewController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return todayFoods.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .subtitle, reuseIdentifier: nil)
        
        cell.textLabel?.text = "\(todayFoods[indexPath.row].name!)   -   \(String(todayFoods[indexPath.row].coloriesPer100Grams))calories"
        cell.detailTextLabel?.text = "C: \(String(todayFoods[indexPath.row].macroCarb))  P: \(String(todayFoods[indexPath.row].macroProtein))  F: \(String(todayFoods[indexPath.row].macroFat))"
        print("\(todayFoods)")
        return cell
    }
}
