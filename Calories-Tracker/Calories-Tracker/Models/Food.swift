//
//  Food.swift
//  Calorie-Tracker-App
//
//  Created by Denislav Todorov on 22.11.22.
//

import UIKit

class Food {
    var name: String
    var caloriesPer100Grams: Int
    var macroFat: Int
    var macroCarb: Int
    var macroProtein: Int
    
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
         caloriesPer100Grams: Int,
         macroFat: Int,
         macroCarb: Int,
         andProtein macroProtein: Int) {
        self.name = name
        self.caloriesPer100Grams = caloriesPer100Grams
        self.macroFat = macroFat
        self.macroCarb = macroCarb
        self.macroProtein = macroProtein
    }

    

}
