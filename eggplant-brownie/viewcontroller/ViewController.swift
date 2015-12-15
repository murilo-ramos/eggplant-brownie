//
//  ViewController.swift
//  eggplant-brownie
//
//  Created by Murilo Ramos on 1/31/15.
//  Copyright (c) 2015 Alura. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, AddItemDelegate {
    
    var items = Array<Item>()
    
    @IBOutlet var nameField:UITextField?
    @IBOutlet var happinessField:UITextField?
    @IBOutlet var tableView:UITableView?
    var delegate:AddMealDelegate?
    
    var selectedItems = Array<Item>()

    override func viewDidLoad() {
        super.viewDidLoad()
        let button = UIBarButtonItem(title: "New Item",
            style: UIBarButtonItemStyle.Plain,
            target: self,
            action: Selector("addNewItem"))
        navigationItem.rightBarButtonItem = button
        self.items = Dao().loadItems()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let item = items[indexPath.row]
        let cell = UITableViewCell(style: UITableViewCellStyle.Default, reuseIdentifier: nil)
        cell.textLabel!.text = item.name
        return cell
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        let cell = tableView.cellForRowAtIndexPath(indexPath)
        if (cell == nil) {
            return
        }
        if (cell!.accessoryType == UITableViewCellAccessoryType.None) {
            cell!.accessoryType = UITableViewCellAccessoryType.Checkmark
            selectedItems.append(items[indexPath.row])
        } else {
            cell!.accessoryType = UITableViewCellAccessoryType.None
            if let itemIndex = selectedItems.indexOf(items[indexPath.row]) {
                selectedItems.removeAtIndex(itemIndex)
            }
        }
    }
    
    @IBAction
    func addMeal() {
        if let meal = self.getMealFromForm() {
            if let delegate = self.delegate {
                delegate.addMeal(meal)
                if let navigationController = self.navigationController {
                    navigationController.popViewControllerAnimated(true)
                } else {
                    Alert(controller: self).show("Unexpected error, but meal added")
                }
                return
            }
        }
        Alert(controller: self).show()
    }
    
    func getMealFromForm() -> Meal? {
        if (self.nameField == nil || self.happinessField == nil) {
            return nil
        }
        
        if (self.nameField!.text == "") {
            return nil
        }
        
        let name = nameField!.text!
        let happiness = Int(happinessField!.text!)
        
        if (happiness == nil) {
            return nil
        }
        
        let meal = Meal(name: name, happiness: happiness!)
        meal.items = selectedItems
        
        print("eaten: \(meal.name), \(meal.happiness)")
        for item in meal.items {
            print("item: \(item.name), \(item.calories)")
        }
        return meal
    }
    
    func addNewItem() {
        let newItemViewController = NewItemViewController(delegate: self)
        if let navigationController = self.navigationController {
            navigationController.pushViewController(newItemViewController, animated: true);
        } else {
            Alert(controller: self).show()
        }
    }
    
    func addItem(item: Item) {
        items.append(item)
        Dao().saveItems(items)
        if let table = tableView {
            table.reloadData()
        } else {
            Alert(controller: self).show("Not expected error, but item added.")
        }
        print ("count \(items.count)")
    }
}

