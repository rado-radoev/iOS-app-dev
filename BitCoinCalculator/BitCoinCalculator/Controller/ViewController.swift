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

class ViewController: UIViewController, UITextFieldDelegate {
    
    //MARK: - Setup label and text field outlets
    @IBOutlet weak var btcTextField: UITextField!
    @IBOutlet weak var usdTextField: UITextField!
    @IBOutlet weak var btcValueLabel: UILabel!
    
    //MARK: - Set up variables
    let bitcoinDataModel = BitCoinDataModel()
    let pasteboard = UIPasteboard.general
    
    //MARK: - On Load
    override func viewDidLoad() {
        super.viewDidLoad()
        
        getCurrencyData(url: bitcoinDataModel.baseURL)
        
        if let string = pasteboard.string {
            btcTextField.text = string
        }
        
        btcTextField.clearsOnBeginEditing = true
        btcTextField.keyboardType = .numbersAndPunctuation
         btcTextField.delegate = self
        
        usdTextField.clearsOnBeginEditing = true
        usdTextField.keyboardType = .numbersAndPunctuation
        usdTextField.delegate = self
    }
    
    //MARK: - Keyboard overrides
    // close keyboard when return is pressed
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        btcTextField.resignFirstResponder()
        usdTextField.resignFirstResponder()
        return true
    }
    
    // close keyboard when pressed outside
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //MARK: - Button actions
    @IBAction func calculateButton(_ sender: UIButton) {
        if btcTextField.text!.isEmpty {
          convertUSDtoBTC()
        }
        else {
            convertBTCtoUSD()
        }
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
            btcTextField.text = String(bitcoinDataModel.usdAmount / bitcoinDataModel.btcRate)
        }
    }
}

