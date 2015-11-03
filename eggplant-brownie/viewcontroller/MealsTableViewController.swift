//
//  MealsTableViewController.swift
//  eggplant-brownie
//
//  Created by Murilo Ramos on 9/14/15.
//  Copyright (c) 2015 Alura. All rights reserved.
//

import UIKit

class MealsTableViewController: UITableViewController, AddMealDelegate {
    
    //var meals = [Meal(name: "File Mignon", happiness: 3), Meal(name: "Picanha", happiness: 5)]
    var meals = Array<Meal>()

    func addMeal(meal: Meal) {
        meals.append(meal)
        Dao().saveMeals(meals)
        tableView.reloadData()
    }
    
    override func viewDidLoad() {
        self.meals = Dao().loadMeals()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if (segue.identifier == "addMeal") {
            let view = segue.destinationViewController as! ViewController
            view.delegate = self
        }
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return meals.count
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        var meal = meals[indexPath.row]
        let cell = UITableViewCell(style: UITableViewCellStyle.Default, reuseIdentifier: nil)
        cell.textLabel!.text = meal.name
        let longPress = UILongPressGestureRecognizer(target: self, action: Selector("showMealDetail:"))
        cell.addGestureRecognizer(longPress)
        return cell
    }
    
    func showMealDetail(recognizer: UILongPressGestureRecognizer) {
        if recognizer.state == UIGestureRecognizerState.Began {
            let cell = recognizer.view as! UITableViewCell
            let indexPath = tableView.indexPathForCell(cell)
            if indexPath == nil {
                return
            }
            let meal = meals[indexPath!.row]
            
            RemoveMealController(controller: self).show(meal,
                handler: { action in
                    self.meals.removeAtIndex(indexPath!.row)
                    Dao().saveMeals(self.meals)
                    self.tableView.reloadData()
                }
            )
        }
    }
    
    
}
