//
//  Food.swift
//  Calorie-Tracker-App
//
//  Created by Denislav Todorov on 22.11.22.
//

import UIKit

class Food {
    var name: String
    var caloriesPer100Grams: Double
    var macroFat: Double
    var macroCarb: Double
    var macroProtein: Double
    
//    convenience init(withName name: String,
//         caloriesPer100Grams: Int,
//         macroFat: Int,
//         macroCarb: Int,
//         macroProtein: Int) {
//        self.init(withName: name,
//            caloriesPer100Grams: caloriesPer100Grams,
//            macroFat: macroFat,
//            macroCarb: macroCarb,
//            macroProtein: macroProtein)
//    }
    init(withName name: String,
         caloriesPer100Grams: Double,
         macroFat: Double,
         macroCarb: Double,
         andProtein macroProtein: Double) {
        self.name = name
        self.caloriesPer100Grams = caloriesPer100Grams
        self.macroFat = macroFat
        self.macroCarb = macroCarb
        self.macroProtein = macroProtein
    }

    

}
