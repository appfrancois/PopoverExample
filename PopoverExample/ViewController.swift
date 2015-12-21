//
//  ViewController.swift
//  PopoverExample
//
//  Created by Francois Duchemin on 21/12/15.
//  Copyright © 2015 appFrancois. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIPopoverPresentationControllerDelegate {

    lazy var aButton: UIBarButtonItem = {
        var filterUIButton = UIButton()
        filterUIButton.setImage(UIImage(named: "a"), forState: .Normal)
        filterUIButton.frame = CGRectMake(0, 0, 24, 24)
        filterUIButton.addTarget(self, action: "aPressed", forControlEvents: .TouchUpInside)
        let filterUIBarButtonItem = UIBarButtonItem(customView: filterUIButton)
        
        return filterUIBarButtonItem
    } ()
    
    lazy var bButton: UIBarButtonItem = {
        var filterSelectedUIButton = UIButton()
        filterSelectedUIButton.setImage(UIImage(named: "b"), forState: .Normal)
        filterSelectedUIButton.frame = CGRectMake(0, 0, 24, 24)
        filterSelectedUIButton.addTarget(self, action: "bPressed", forControlEvents: .TouchUpInside)
        let filterSelectedUIBarButtonItem = UIBarButtonItem(customView: filterSelectedUIButton)
        
        return filterSelectedUIBarButtonItem
    } ()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        navigationItem.setRightBarButtonItems([bButton, aButton], animated: true)
        navigationItem.title = "Test"
    }
    
    func aPressed() {
        print("A pressed: display popover")
        performSegueWithIdentifier("popover", sender: nil)
    }
    
    func bPressed() {
        print("B pressed")
    }
    
    // MARK: - UIPopoverPresentationControllerDelegate

    func adaptivePresentationStyleForPresentationController(controller: UIPresentationController) -> UIModalPresentationStyle {
        return UIModalPresentationStyle.None
    }

    // MARK: - Navigation
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if (segue.identifier == "popover") {
            let popoverViewController = segue.destinationViewController
            popoverViewController.modalPresentationStyle = UIModalPresentationStyle.Popover
            if let popoverViewController = popoverViewController.popoverPresentationController {
                popoverViewController.delegate = self
                popoverViewController.barButtonItem = aButton
            }
        }
    }
}

