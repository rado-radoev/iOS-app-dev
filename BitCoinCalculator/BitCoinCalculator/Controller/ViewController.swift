//
//  ViewController.swift
//  BitCoinCalculator
//
//  Created by Radoslav Radoev on 12/23/17.
//  Copyright © 2017 Radoslav Radoev. All rights reserved.
//

import UIKit
import SwiftyJSON
import Alamofire

class ViewController: UIViewController {
    
    let baseURL = "https://apiv2.bitcoinaverage.com/indices/global/ticker/BTC"
    let currencyArray = ["USD"]
    let currencyIcon = ["$"]
    var finalURL = ""

    @IBOutlet weak var btcTextField: UITextField!
    @IBOutlet weak var usdTextField: UITextField!

    
    let bitcoinDataModel = BitCoinDataModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func calculateButton(_ sender: UIButton) {
    }
    
    //MARK: UIPickerView delegate methods
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return currencyArray.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return currencyArray[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        exchangeRateDataModel.currencyIcon = currencyIcon[row]
        finalURL = baseURL + currencyArray[row]
        getCurrencyData(url: finalURL)
        //print(finalURL)
    }
    
    //MARK: - Parsing JSON
    func updateExchangeRate(json : JSON) {
        
        let rate = json["last"].doubleValue
        
        //bitcoinPriceLabel.text = exchangeRateDataModel.currencyIcon + " " + String(rate)
    }
    
    //MARK: - Network Process Data
    func getCurrencyData(url: String) {
        
        Alamofire.request(url, method: .get).responseJSON {
            response in
            if response.result.isSuccess {
                //print("Sucess! Got the current rate")
                //print(bitcoinJSON)
                let bitcoinJSON : JSON = JSON(response.result.value!)
                self.updateExchangeRate(json: bitcoinJSON)
            } else {
                print("Error: \(String(describing: response.result.error))")
                self.bitcoinPriceLabel.text = "Connection Issues"
            }
        }
    }
    
    //MARK: - Currency Convertion
    func convertBTCtoUSD(bitcoin: Decimal) -> Decimal {
        
        return 0.0
    }
    
    func convertUSDtoBTC(usd: Decimal) -> Decimal {
        
        return 0.0
    }
}

