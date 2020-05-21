//
//  DetailsViewController.swift
//  Homework25(1)
//
//  Created by Kato on 5/21/20.
//  Copyright © 2020 TBC. All rights reserved.
//

import UIKit

class DetailsViewController: UIViewController {

    @IBOutlet weak var countryLabel: UILabel!
    
    @IBOutlet weak var nativeNameLabel: UILabel!
    
    @IBOutlet weak var capitalLabel: UILabel!
    
    @IBOutlet weak var regionLabel: UILabel!
    
    @IBOutlet weak var populationLabel: UILabel!
    
  //  @IBOutlet weak var flagImageView: UIImageView!
    
    var countryName = ""
    var capitalName = ""
    var nativeName = ""
    var region = ""
    var population = 0
    
   // var flagImage = UIImageView()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.countryLabel.text = countryName
        self.nativeNameLabel.text = "Native Name: \(nativeName)"
        self.capitalLabel.text = "Capital: \(capitalName)"
        self.regionLabel.text = "Region: \(region)"
        self.populationLabel.text = "Population: \(String(population))"
        
       // self.flagImageView.image = flagImage.image
        
        // Do any additional setup after loading the view.
    }
    

}

