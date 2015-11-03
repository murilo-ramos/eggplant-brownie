//
//  Meal.swift
//  eggplant-brownie
//
//  Created by Murilo Ramos on 2/19/15.
//  Copyright (c) 2015 Alura. All rights reserved.
//

import Foundation

class Meal : NSObject, NSCoding {
    
    let name: String
    let happiness: Int
    
    var items = Array<Item>()
    
    init(name: String, happiness: Int) {
        self.name      = name
        self.happiness = happiness
    }
    
    required init(coder aDecoder: NSCoder) {
        self.name = aDecoder.decodeObjectForKey("name") as! String
        self.happiness = aDecoder.decodeIntegerForKey("happiness")
        self.items = aDecoder.decodeObjectForKey("items") as! Array<Item>
    }
    
    func encodeWithCoder(aCoder: NSCoder) {
        aCoder.encodeObject(self.name, forKey: "name")
        aCoder.encodeInteger(self.happiness, forKey: "happiness")
        aCoder.encodeObject(self.items, forKey: "items")
    }
    
    func allCalories() -> Double {
        var total: Double = 0
        
        for item in items {
            total += item.calories
        }
        
        return total
    }
    
    func details() -> String {
        var detail = "Happiness: \(happiness)\n"
        for item in items {
            detail += "- \(item.name) \(item.calories) calories\n"
        }
        return detail
    }
    
}