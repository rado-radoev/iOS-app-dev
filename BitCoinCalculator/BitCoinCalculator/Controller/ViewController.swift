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

    @IBOutlet weak var btcTextField: UITextField!
    @IBOutlet weak var usdTextField: UITextField!
    @IBOutlet weak var btcValueLabel: UILabel!
    
    let bitcoinDataModel = BitCoinDataModel()

    override func viewDidLoad() {
        super.viewDidLoad()
        getCurrencyData(url: bitcoinDataModel.baseURL)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func calculateButton(_ sender: UIButton) {
        convertUSDtoBTC()
    }
    
    
    //MARK: - Parsing JSON
    func updateExchangeRate(json : JSON) {
        
        bitcoinDataModel.btcRate = json["ask"].doubleValue
        let formatter = NumberFormatter()
        formatter.numberStyle = NumberFormatter.Style.decimal
        let formatted = formatter.string(from: NSNumber(value: bitcoinDataModel.btcRate))
        btcValueLabel.text = "$ \(formatted ?? "0.00")"
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
                self.btcValueLabel.text = "Connection Issues"
            }
        }
    }
    
    //MARK: - Currency Convertion
    func convertBTCtoUSD() {
        if !btcTextField.text!.isEmpty {
            bitcoinDataModel.btcAmount = NSString(string: btcTextField.text!).doubleValue
            usdTextField.text = String(bitcoinDataModel.btcAmount * bitcoinDataModel.btcRate)
        }
    }
    
    func convertUSDtoBTC() {
        if !usdTextField.text!.isEmpty {
            bitcoinDataModel.usdAmount = NSString(string: usdTextField.text!).doubleValue
            btcTextField.text = String(bitcoinDataModel.btcRate / bitcoinDataModel.usdAmount)
        }
    }
}

