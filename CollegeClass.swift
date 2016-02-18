//
//  CollegeClass.swift
//  college profile builder
//
//  Created by edejesu on 1/20/16.
//  Copyright © 2016 edejesu. All rights reserved.
//

import UIKit

class CollegeClass: NSObject
{

    var name = ""
    var location = ""
    var numberStudents = 0
    var image = UIImage(named: "nothing")
    var webpage = ""
    
    init(Name: String, Location: String, NumberStudents: Int, Image: UIImage, Webpage: String)
    {
        super.init()
        name = Name
        location = Location
        numberStudents = NumberStudents
        image = Image
        webpage = Webpage
    }
    init(Name: String, Location: String, NumberStudents: Int, Webpage: String)
    {
        super.init()
        name = Name
        location = Location
        numberStudents = NumberStudents
        webpage = Webpage
    }

}


