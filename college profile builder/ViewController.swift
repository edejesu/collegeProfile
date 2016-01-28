//
//  ViewController.swift
//  college profile builder
//
//  Created by edejesu on 1/20/16.
//  Copyright © 2016 edejesu. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate
{

    @IBOutlet weak var editButton: UIBarButtonItem!
    @IBOutlet weak var myTableView: UITableView!
    
    var colleges : [CollegeClass] = []
    
    override func viewWillAppear(animated: Bool)
    {
        myTableView.reloadData()
    }
    
    override func viewDidLoad()
    {

        super.viewDidLoad()
        myTableView.dataSource = self
        myTableView.delegate = self
        editButton.tag = 0
        colleges.append(CollegeClass(Name: "Iowa State", Location: "Ames, Iowa", NumberStudents: 34732, Image: UIImage(named: "iowa state")!))
        colleges.append(CollegeClass(Name: "Purdue", Location: "West Lafayette, Indiana", NumberStudents: 38770, Image: UIImage(named: "purdue")!))
        colleges.append(CollegeClass(Name: "Michigan State", Location: "East Lansing, Michigan", NumberStudents: 50085, Image: UIImage(named: "michigan state")!))
        colleges.append(CollegeClass(Name: "Iowa", Location: "Iowa City, Iowa", NumberStudents: 31387, Image: UIImage(named: "iowa")!))
    }
    
    @IBAction func editButtonTapped(sender: UIBarButtonItem)
    {
        if editButton.tag == 0
        {
            myTableView.editing = true
            editButton.tag = 1
        }
        else
        {
            myTableView.editing = false
            editButton.tag = 0
        }
    }
    
    @IBAction func addButtonTapped(sender: UIBarButtonItem)
    {
        let myAlert = UIAlertController(title: "add college", message: nil, preferredStyle: .Alert)
        myAlert.addTextFieldWithConfigurationHandler
            {
             (nameTextfield) -> Void in
                nameTextfield.placeholder = "add college name"
            }
        myAlert.addTextFieldWithConfigurationHandler
            {
              (locationTextfield) -> Void in
                locationTextfield.placeholder = " add location"
            }
        myAlert.addTextFieldWithConfigurationHandler
            {
                (numberStudentsTextfield) -> Void in
                numberStudentsTextfield.placeholder = "add number of students"
        }

        var cancelAction = UIAlertAction(title: "cancel", style: UIAlertActionStyle.Cancel, handler: nil)
                myAlert.addAction(cancelAction)
        var addAction = UIAlertAction(title: "add", style: .Default)
            {
                (addAction) -> Void in
                let collegeTF = myAlert.textFields![0] as UITextField
                let locationTF = myAlert.textFields![1] as UITextField
                let numberStudentsTF = myAlert.textFields![2] as UITextField
                self.colleges.append(CollegeClass(Name: collegeTF.text!, Location: locationTF.text!, NumberStudents: Int(numberStudentsTF.text!)!))
                self.myTableView.reloadData()
        }
        myAlert.addAction(addAction)
        self.presentViewController(myAlert, animated: true, completion: nil)
    }
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell
    {
        let myCell = myTableView.dequeueReusableCellWithIdentifier("myCell", forIndexPath: indexPath)
        myCell.textLabel!.text = colleges[indexPath.row].name
        myCell.detailTextLabel!.text = colleges[indexPath.row].location
    
        return myCell
       
        
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return colleges.count
    }
    
    func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath)
    {
        if editingStyle == .Delete
        {
            colleges.removeAtIndex(indexPath.row)
            myTableView.reloadData()
        }
    }
    
    func tableView(tableView: UITableView, canMoveRowAtIndexPath indexPath: NSIndexPath) -> Bool
    {
        return true
    }
    func tableView(tableView: UITableView, moveRowAtIndexPath sourceIndexPath: NSIndexPath, toIndexPath destinationIndexPath: NSIndexPath)
    {
        let college = colleges[sourceIndexPath.row]
        colleges.removeAtIndex(sourceIndexPath.row)
        colleges.insert(college, atIndex: destinationIndexPath.row)
    }
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?)
    {
        let detailView = segue.destinationViewController as! DetailViewController
        let selectedRow = myTableView.indexPathForSelectedRow?.row
        detailView.college = colleges[selectedRow!]
    }
    
    }
    

    

    


