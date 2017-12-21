//
//  ViewController.swift
//  The Weather App
//
//  Created by Radoslav Radoev on 12/20/17.
//  Copyright © 2017 Radoslav Radoev. All rights reserved.
//

import UIKit
import CoreLocation
import SwiftyJSON
import Alamofire

class WeatherViewController: UIViewController, CLLocationManagerDelegate {

    // Pre-linked IBOutlets
    @IBOutlet weak var faren: UISwitch!
    @IBOutlet weak var farenLabel: UILabel!
    
    // Constants
    let WEATHER_URL = "http://api.openweathermap.org/data/2.5/weather"
    let APP_ID = "e72ca729af228beabd5d20e3b7749713"
    
    @IBAction func `switch`(_ sender: Any) {
        let farenSwitch = sender as! UISwitch
        if !farenSwitch.isOn {
            farenLabel.text = "℉"
        }
    }
    
    // Instance variables
    let locationManager = CLLocationManager()
    let weatherDataModel = WeatherDataModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    //MARK: - Networking

    
    //MARK: - JSON Parsking
    
    //MARK: - UI Updates
    
    //MARK: - Location Manager Delegate Methods
    
    //MARK: - Change City Delegate Methods
    
}

