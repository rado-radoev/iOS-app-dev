//
//  BitCoinDataModel.swift
//  BitCoinCalculator
//
//  Created by Radoslav Radoev on 12/23/17.
//  Copyright © 2017 Radoslav Radoev. All rights reserved.
//

import UIKit

class BitCoinDataModel {
    var btcAmount : Double = 0.0
    var usdAmount : Double = 0.0
    var btcRate : Double = 0.0
    let baseURL = "https://apiv2.bitcoinaverage.com/indices/global/ticker/BTCUSD"
}
