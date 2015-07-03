//
//  ViewController.swift
//  BasicsOfSwift
//
//  Created by Suraj on 25/06/15.
//  Copyright (c) 2015 Suraj. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet var tableView: UITableView!
    var items :[String:NSInteger] = ["Cold Drinks":4, "Water bottles":2, "Burgers":4, "Ice Cream":8]
    
    var arrPlayerNumber = [1,2,3,4,5,6,7,8,9,10,11,12,13,14,15]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        self.title = "Editing TableView"
        
        
        ////        Type Casting        ////
        let label = "The width is "
        let width = 60
        let widthLabel = label + String(width)
        println(widthLabel)
        
        
        
        
        ////    Add Values in String using \()      ////
        let apples = 3
        let oranges = 5
        let appleSummary = "I have \(apples) apples"
        let fruitSummary = "I have \(oranges + apples) fruits"
        println(fruitSummary)
        
        
        
        
        ////        Arrays      ////
        let emptyArray = [String]() // initialize empty array with String data type
        
        let newEmptyArray = [] // initialize an empty array without any data type
        
        var shoppingListArray = ["Catfish", "Water", "Tulips", "Blue Paint"] // Set data to array
        shoppingListArray[1] = "Water Bottle"   // Change data for object at Index 1
        shoppingListArray.append("Toilet Soap") // Dynamically add an object to array
        shoppingListArray.removeAtIndex(2)      // Dynamically remove an object from array
        println(shoppingListArray)
        
        
        
        
        ////        Dictionary      ////
        let emptyDictionary = [String: Float]() // initialize empty dictionary with String key & Float value data types
        
        let newEmptyDictionary = [:] // initialize an empty dictionary without any data type for key & value
        
        var heightOfStudents = [
            "Abhi": 5.8,
            "Ashok": 5.5,
            "Bhanu": 6.1,
            "Himmat": 5.10,
            "Kamaal": 5.6
        ]                       // Set data to dictionary
        
        heightOfStudents["Ashok"] = 5.4                 // Change value for provided key
        heightOfStudents["Paramjeet"] = 5.11            // Dynamically add key-value to dictonary
        heightOfStudents.removeValueForKey("Himmat")    // Dynamically remove value for key from dictionary
        println(heightOfStudents)
        
        
        
        
        ////        Method Call         ////
        self.forEachLoopInSwift()
        
        
        self.tableView.registerClass(UITableViewCell.self, forCellReuseIdentifier: "TableCell")
        
        self.navigationItem.leftBarButtonItem = self.editButtonItem()
        
        var imgBarBtnAdd = UIImage(named: "icon_add.png")
        let barBtnAddRow = UIBarButtonItem(image: imgBarBtnAdd, style: .Plain, target: self, action: "insertNewRow:")
        self.navigationItem .setRightBarButtonItem(barBtnAddRow, animated: true)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func forEachLoopInSwift() {
        for player in self.arrPlayerNumber {
            if player < 12 {
                println("Player number \(player) is on field")
            } else {
                println("Player number \(player) is extra player")
            }
        }
    }
   
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // return self.items.count
        return self.arrPlayerNumber.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        /* var cell: UITableViewCell = UITableViewCell(style: UITableViewCellStyle.Subtitle, reuseIdentifier: "TableCell")
        var strKeyOfDictionary = Array(self.items.keys)[indexPath.row]
        cell.textLabel.text = strKeyOfDictionary
        var strValueOfDictionary = Array(self.items.values)[indexPath.row]
        cell.detailTextLabel?.text = String(strValueOfDictionary)
        return cell */
        
        var cell: UITableViewCell = UITableViewCell(style: UITableViewCellStyle.Default, reuseIdentifier: "TableCell")
        cell.textLabel?.text = String(self.arrPlayerNumber[indexPath.row])
        return cell
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        var alert = UIAlertController(title: "Basics Of Swift", message: "You have clicked \(indexPath.row+1) row", preferredStyle: UIAlertControllerStyle.Alert)
        alert.addAction(UIAlertAction (title: "Ok", style: .Default, handler: {
            action in
            switch action.style {
            case .Default:
                println("default")
                
            case .Cancel:
                println("cancel")
                
            case .Destructive:
                println("destructive")
            }
        }))
        alert.addAction(UIAlertAction(title: "Cancel", style: UIAlertActionStyle.Destructive, handler: nil))

        self.presentViewController(alert, animated: true, completion: nil)
    }
    
    override func setEditing(editing: Bool, animated: Bool) {
        self.tableView .setEditing(true, animated: true)
    }
    
    func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if (editingStyle == UITableViewCellEditingStyle.Delete) {
            self.arrPlayerNumber.removeAtIndex(indexPath.row)
            let arrIndexesToDelete = [indexPath]
            self.tableView.deleteRowsAtIndexPaths(arrIndexesToDelete, withRowAnimation: UITableViewRowAnimation.Right)
        } else if (editingStyle == UITableViewCellEditingStyle.Insert) {
            
        }
    }

    func tableView(tableView: UITableView, moveRowAtIndexPath sourceIndexPath: NSIndexPath, toIndexPath destinationIndexPath: NSIndexPath) {
        let rowContent = self.arrPlayerNumber[sourceIndexPath.row]
        self.arrPlayerNumber.removeAtIndex(sourceIndexPath.row)
        self.arrPlayerNumber.insert(rowContent, atIndex: destinationIndexPath.row)
    }
    
    func insertNewRow(sender: UIBarButtonItem) {
        self.arrPlayerNumber .append(self.arrPlayerNumber.count+1)
        let indexOfLastRow = NSIndexPath(forRow: self.arrPlayerNumber.count-1, inSection: 0)
        let arrIndexesToInsert = [indexOfLastRow]
        self.tableView .insertRowsAtIndexPaths(arrIndexesToInsert, withRowAnimation: UITableViewRowAnimation.Left)
        self.tableView.scrollToRowAtIndexPath(indexOfLastRow, atScrollPosition: UITableViewScrollPosition.Bottom, animated: true)
    }
    
}

