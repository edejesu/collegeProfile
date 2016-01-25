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
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        myTableView.dataSource = self
        myTableView.delegate = self
        editButton.tag = 0
        colleges.append(CollegeClass(Name: "Iowa State", Location: "Ames, Iowa", NumberStudents: 34732, Image: UIImage(named: "iowa state")!))
        colleges.append(CollegeClass(Name: "Purdue", Location: "West Lafayette, Indiana", NumberStudents: 38770, Image: UIImage(named: "purdue")!))
        colleges.append(CollegeClass(Name: "Michigan State", Location: "East Lansing, Michigan", NumberStudents: 50085, Image: UIImage(named: "mich state")!))
        colleges.append(CollegeClass(Name: "Iowa", Location: "Iowa City, Iowa", NumberStudents: 31387, Image: UIImage(named: "iowa")!))
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
        var cancelAction = UIAlertAction(title: "cancel", style: UIAlertActionStyle.Cancel, handler: nil)
                myAlert.addAction(cancelAction)
        var addAction = UIAlertAction(title: "add", style: .Default)
            {
                (addAction) -> Void in
                let collegeTF = myAlert.textFields![0] as UITextField
                let locationTF = myAlert.textFields![1] as UITextField
                self.colleges.append(CollegeClass(Name: collegeTF.text!, Location: locationTF.text!))
                self.myTableView.reloadData()
        }
        myAlert.addAction(addAction)
        self.presentViewController(myAlert, animated: true, completion: nil)
    }
    
    }
    

    
}

