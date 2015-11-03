//
//  Alert.swift
//  eggplant-brownie
//
//  Created by Murilo Ramos on 10/1/15.
//  Copyright (c) 2015 Alura. All rights reserved.
//

import UIKit

class Alert {
    
    let controller:UIViewController
    
    init(controller: UIViewController) {
        self.controller = controller
    }
    
    func show(message: String = "Unexpected error :(") {
        let alertController = UIAlertController(title: "Attention",
            message: message,
            preferredStyle: UIAlertControllerStyle.Alert)
        alertController.addAction(UIAlertAction(title: "Understood", style: UIAlertActionStyle.Cancel, handler: nil))
        controller.presentViewController(alertController, animated: true, completion: nil)
    }
    
}
