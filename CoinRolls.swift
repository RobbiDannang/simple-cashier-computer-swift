//
//  CoinRolls.swift
//  Simple Cashier Computer
//
//  Created by Dianne Robbi on 2/9/17.
//  Copyright © 2017 RoadDeum. All rights reserved.
//

import UIKit

class CoinRolls: UIViewController {
    
    @IBOutlet var quartersQuantity: UITextField!
    @IBOutlet var dimesQuantity: UITextField!
    @IBOutlet var nickelsQuantity: UITextField!
    @IBOutlet var penniesQuantity: UITextField!
    
    @IBOutlet var quartersTotal: UILabel!
    @IBOutlet var dimesTotal: UILabel!
    @IBOutlet var nickelsTotal: UILabel!
    @IBOutlet var penniesTotal: UILabel!
    
    @IBOutlet var calculateRolls: UIButton!
    
    @IBOutlet var totalQuantity: UILabel!
    @IBOutlet var totalAmount: UILabel!
    
    @IBOutlet public var overallTotal: UILabel!
    
    static var overall = Float(0)
    static var amountSum = Float(0)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        CoinRolls.overall = CoinRolls.amountSum + Bills().getTotal() + LooseCoins().getTotal()
        overallTotal.text = String(format: "Total: $ %03.2f", CoinRolls.overall)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool{
        quartersQuantity.resignFirstResponder()
        return true
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func buttonTapped(_ sender: UIButton) {
        var product = Float(0)
        var billsSum = 0
        
        if Int(quartersQuantity.text!) == nil {
            CoinRolls.amountSum = Float(0)
            quartersTotal.text = "$ 0.00"
        }
        else{
            billsSum = Int(quartersQuantity.text!)! + billsSum
            product = Float(quartersQuantity.text!)! * 10
            quartersTotal.text = String(format: "$ %03.2f", product)
            CoinRolls.amountSum = product
        }
        if Int(dimesQuantity.text!) == nil {
            dimesTotal.text = "$ 0.00"
        }
        else{
            billsSum = Int(dimesQuantity.text!)! + billsSum
            product = Float(dimesQuantity.text!)! * 5
            dimesTotal.text = String(format: "$ %03.2f", product)
            CoinRolls.amountSum = CoinRolls.amountSum + product
        }
        if Int(nickelsQuantity.text!) == nil {
            nickelsTotal.text = "$ 0.00"
        }
        else{
            billsSum = Int(nickelsQuantity.text!)! + billsSum
            product = Float(nickelsQuantity.text!)! * 2
            nickelsTotal.text = String(format: "$ %03.2f", product)
            CoinRolls.amountSum = CoinRolls.amountSum + product
        }
        if Int(penniesQuantity.text!) == nil {
            penniesTotal.text = "$ 0.00"
        }
        else{
            billsSum = Int(penniesQuantity.text!)! + billsSum
            product = Float(penniesQuantity.text!)! * 0.50
            penniesTotal.text = String(format: "$ %03.2f", product)
            CoinRolls.amountSum = CoinRolls.amountSum + product
        }
        
        totalQuantity.text = String(billsSum)
        totalAmount.text = String(format: "$ %03.2f", CoinRolls.amountSum)
        CoinRolls.overall = CoinRolls.amountSum + Bills().getTotal() + LooseCoins().getTotal()
        overallTotal.text = String(format: "Total: $ %03.2f", CoinRolls.overall)
    }
    
    func getTotal() -> Float{
        return CoinRolls.amountSum
    }
}

