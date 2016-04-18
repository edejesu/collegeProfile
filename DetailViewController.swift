//
//  DetailViewController.swift
//  college profile builder
//
//  Created by edejesu on 1/26/16.
//  Copyright © 2016 edejesu. All rights reserved.
//

import UIKit
import SafariServices


class DetailViewController: UIViewController, SFSafariViewControllerDelegate, UIImagePickerControllerDelegate, UINavigationControllerDelegate

{
    @IBOutlet weak var myImageView: UIImageView!
    @IBOutlet weak var nameTextfield: UITextField!
    @IBOutlet weak var locationTextfield: UITextField!
    @IBOutlet weak var numberStudentsTextfield: UITextField!
    @IBOutlet weak var webpageTextfield: UITextField!
    var college : CollegeClass!
    var myPhotos : [UIImage] = []
    var counter = 0
     var myImagePicker = UIImagePickerController()
    
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        nameTextfield.text = college.name
        locationTextfield.text = college.location
        numberStudentsTextfield.text = String(college.numberStudents)
        myImageView.image = college.image
        webpageTextfield.text = college.webpage
        myImagePicker.delegate = self
        myImagePicker.allowsEditing = true
        
    }
    @IBAction func addPicture(sender: UIBarButtonItem)
    {
        let mySheet = UIAlertController(title: "", message: nil, preferredStyle: UIAlertControllerStyle.ActionSheet)
        //creates action sheet
        mySheet.addAction(UIAlertAction(title: "camera", style: .Default, handler: { (cameraAction) -> Void in
            if UIImagePickerController.isSourceTypeAvailable(UIImagePickerControllerSourceType.Camera)
            {
                self.myImagePicker.sourceType = UIImagePickerControllerSourceType.Camera
                self.presentViewController(self.myImagePicker, animated: true, completion: nil)
            }
            else
            {
                self.myImagePicker.sourceType = UIImagePickerControllerSourceType.PhotoLibrary
                self.presentViewController(self.myImagePicker, animated: true, completion: nil)
            }
        }))
        //creates button and action for action sheet
        mySheet.addAction(UIAlertAction(title: "photo library", style: .Default, handler: { (libraryAction) -> Void in
            self.myImagePicker.sourceType = UIImagePickerControllerSourceType.PhotoLibrary
            self.presentViewController(self.myImagePicker, animated: true, completion: nil)
            
        }))
        //presents action shee
        self.presentViewController(mySheet, animated: true, completion: nil)
    }
    func imagePickerController(picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : AnyObject])
    {
        myImagePicker.dismissViewControllerAnimated(true) { () -> Void in
            self.myPhotos.append(info[UIImagePickerControllerEditedImage] as! UIImage)
            self.myImageView.image = self.myPhotos[0]
        }
    }
    
    @IBAction func webButtonTapped(sender: UIButton)
    {
        var myURL = NSURL(string:(webpageTextfield.text!))
        var SVC = SFSafariViewController(URL: myURL!)
        SVC.delegate = self
        presentViewController(SVC, animated: true, completion: nil)
    }
    func safariViewControllerDidFinish(controller: SFSafariViewController)
    {
        controller.dismissViewControllerAnimated(true, completion: nil)
    }
    @IBAction func saveButtonTapped(sender: UIButton)
    {
        college.name = nameTextfield.text!
        college.location = locationTextfield.text!
        college.numberStudents = Int(numberStudentsTextfield.text!)!
        college.webpage = webpageTextfield.text!
    }
    
    @IBAction func mapButtonTapped(sender: UIButton)
    {

    }
    

 }
