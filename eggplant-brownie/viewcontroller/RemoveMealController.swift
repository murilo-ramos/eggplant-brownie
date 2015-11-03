//
//  RemoveMealController.swift
//  eggplant-brownie
//
//  Created by Murilo Ramos on 10/13/15.
//  Copyright (c) 2015 Alura. All rights reserved.
//

import UIKit


class RemoveMealController {
    
    let controller:UIViewController
    
    init(controller: UIViewController) {
        self.controller = controller
    }
    
    func show(meal: Meal, handler: (UIAlertAction!) -> Void) {
        let alertController = UIAlertController(title: meal.name,
            message: meal.details(),
            preferredStyle: UIAlertControllerStyle.Alert)
        
        alertController.addAction(UIAlertAction(title: "Cancel", style: UIAlertActionStyle.Cancel, handler: nil))
        alertController.addAction(UIAlertAction(title: "Remove", style: UIAlertActionStyle.Destructive, handler: handler))
        self.controller.presentViewController(alertController, animated: true, completion: nil)
    }
    
    
    
}
