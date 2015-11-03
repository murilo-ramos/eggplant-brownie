//
//  Dao.swift
//  eggplant-brownie
//
//  Created by Murilo Ramos on 10/26/15.
//  Copyright (c) 2015 Alura. All rights reserved.
//

import Foundation

class Dao {
    let itemsFileName = "eggplant-brownie-items.dat"
    let mealsFileName = "eggplant-brownie-meals.dat"
    
    let itemsArchive:String
    let mealsArchive:String
    
    init() {
        let directories = NSSearchPathForDirectoriesInDomains(NSSearchPathDirectory.DocumentDirectory,
            NSSearchPathDomainMask.UserDomainMask,
            true)
        let path = directories[0] as! String
        itemsArchive = path + "/" + itemsFileName
        mealsArchive = path + "/" + mealsFileName
    }
    
    func loadItems() -> Array<Item> {
        if let items: AnyObject = NSKeyedUnarchiver.unarchiveObjectWithFile(itemsArchive) {
            return items as! Array<Item>
        } else {
            return Array<Item>()
        }
    }
    
    func saveItems(items:Array<Item>) {
        NSKeyedArchiver.archiveRootObject(items, toFile: itemsArchive)
    }
    
    func loadMeals() -> Array<Meal> {
        if let meals: AnyObject = NSKeyedUnarchiver.unarchiveObjectWithFile(mealsArchive) {
            return meals as! Array<Meal>
        } else {
            return Array<Meal>()
        }
    }
    
    func saveMeals(meals:Array<Meal>) {
        NSKeyedArchiver.archiveRootObject(meals, toFile: mealsArchive)
    }
    
}