//
//  ViewController.swift
//  Pizza builder
//
//  Created by Dante Solorio on 1/6/16.
//  Copyright © 2016 Dante Solorio. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var nextButton: UIBarButtonItem!
    
    let pizzaSize = ["Chica", "Mediana", "Grande"]
    var lastSelectedIndexPath: NSIndexPath!

    override func viewDidLoad() {
        super.viewDidLoad()
        nextButton.enabled = false
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: Table view delegates
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell: UITableViewCell = tableView.dequeueReusableCellWithIdentifier("Cell", forIndexPath: indexPath)

        cell.textLabel?.text = pizzaSize[indexPath.row]
        return cell
    }

    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return pizzaSize.count
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        nextButton.enabled = true
        if((lastSelectedIndexPath) != nil) {
            
            let lastCell = tableView.cellForRowAtIndexPath(lastSelectedIndexPath)
            lastCell?.accessoryType = .None
        }
        
        let currentCell = tableView.cellForRowAtIndexPath(indexPath)
        currentCell?.accessoryType =  .Checkmark
        
        lastSelectedIndexPath = indexPath;
        
        
        
    }
    
    // MARK: Actions

    @IBAction func nextAction(sender:AnyObject){
        self.performSegueWithIdentifier("chooseMasa", sender: self)
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "chooseMasa"{
            let destinationVC = segue.destinationViewController as! MasaViewController
            destinationVC.pizzaSize = pizzaSize[lastSelectedIndexPath.row]
        }
        
    }
}

