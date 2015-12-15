//
//  NewItemViewController.swift
//  eggplant-brownie
//
//  Created by Murilo Ramos on 9/21/15.
//  Copyright (c) 2015 Alura. All rights reserved.
//

import UIKit

class NewItemViewController: UIViewController {
    
    @IBOutlet var itemNameField: UITextField?
    @IBOutlet var caloriesField: UITextField?
    var delegate:AddItemDelegate?
    
    init(delegate: AddItemDelegate) {
        super.init(nibName: "NewItemViewController", bundle: nil)
        self.delegate = delegate
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    @IBAction
    func addItem() {
        if (self.itemNameField == nil || self.caloriesField == nil) {
            return
        }
        
        if (self.itemNameField!.text == "") {
            return
        }
        
        let itemName = itemNameField!.text!
        let calories = (caloriesField!.text! as NSString).doubleValue
        
        let item = Item(name: itemName, calories: calories)
        
        print("item \(item.name), \(item.calories)")
        
        if let delegate = self.delegate {
            delegate.addItem(item)
            if let navigationController = self.navigationController {
                navigationController.popViewControllerAnimated(true)
            }
        }
    }

}
