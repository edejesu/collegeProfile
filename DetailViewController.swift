//
//  DetailViewController.swift
//  college profile builder
//
//  Created by edejesu on 1/26/16.
//  Copyright © 2016 edejesu. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController
{

    @IBOutlet weak var myImageView: UIImageView!
    @IBOutlet weak var nameTextfield: UITextField!
    @IBOutlet weak var locationTextfield: UITextField!
    @IBOutlet weak var numberStudentsTextfield: UITextField!
    var college : CollegeClass!
    
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        nameTextfield.text = college.name
        locationTextfield.text = college.location
        numberStudentsTextfield.text = String(college.numberStudents)
        myImageView.image = college.image
        
    }
    @IBAction func saveButtonTapped(sender: UIButton)
    {
        college.name = nameTextfield.text!
        college.location = locationTextfield.text!
        college.numberStudents = Int(numberStudentsTextfield.text!)!
    }
    

 }
