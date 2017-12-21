//
//  ChangeCityViewController.swift
//  Climacterium
//
//  Created by Radoslav Radoev on 12/20/17.
//  Copyright © 2017 Radoslav Radoev. All rights reserved.
//

import UIKit

protocol ChangeCityDelegate {
    func userEnteredNewCityName(city : String)
}

class ChangeCityViewController: UIViewController {
    var delegate : ChangeCityDelegate?
    
    @IBOutlet weak var changeCityTextField: UITextField!
    
    @IBAction func getWeatherButtonPressed(_ sender: Any) {
        let cityName = changeCityTextField.text!
        
        delegate?.userEnteredNewCityName(city: cityName)
        
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func backButtonPressed(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
}
