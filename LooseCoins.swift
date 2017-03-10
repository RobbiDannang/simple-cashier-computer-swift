//
//  LooseCoins.swift
//  Simple Cashier Computer
//
//  Created by Dianne Robbi on 2/9/17.
//  Copyright © 2017 RoadDeum. All rights reserved.
//

import UIKit

class LooseCoins: UIViewController {
    
    @IBOutlet var dollarQuantity: UITextField!
    @IBOutlet var halfQuantity: UITextField!
    @IBOutlet var quartersQuantity: UITextField!
    @IBOutlet var dimesQuantity: UITextField!
    @IBOutlet var nickelsQuantity: UITextField!
    @IBOutlet var penniesQuantity: UITextField!
    
    @IBOutlet var dollarTotal: UILabel!
    @IBOutlet var halfTotal: UILabel!
    @IBOutlet var quartersTotal: UILabel!
    @IBOutlet var dimesTotal: UILabel!
    @IBOutlet var nickelsTotal: UILabel!
    @IBOutlet var penniesTotal: UILabel!
    
    @IBOutlet var calculateCoins: UIButton!
    
    @IBOutlet var totalQuantity: UILabel!
    @IBOutlet var totalAmount: UILabel!
    
    @IBOutlet public var overallTotal: UILabel!
    
    static var overall = Float(0)
    static var amountSum = Float(0)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        LooseCoins.overall = LooseCoins.amountSum + CoinRolls().getTotal() + Bills().getTotal()
        overallTotal.text = String(format: "Total: $ %03.2f", LooseCoins.overall)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool{
        dollarQuantity.resignFirstResponder()
        return true
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func buttonClicked(_ sender: UIButton) {
        var product = Float(0)
        var billsSum = 0
        
        if Int(dollarQuantity.text!) == nil {
            LooseCoins.amountSum = Float(0)
            dollarTotal.text = "$ 0.00"
        }
        else{
            billsSum = Int(dollarQuantity.text!)! + billsSum
            product = Float(dollarQuantity.text!)!
            dollarTotal.text = String(format: "$ %03.2f", product)
            LooseCoins.amountSum = product
        }
        if Int(halfQuantity.text!) == nil {
            halfTotal.text = "$ 0.00"
        }
        else{
            billsSum = Int(halfQuantity.text!)! + billsSum
            product = Float(halfQuantity.text!)! * 0.50
            halfTotal.text = String(format: "$ %03.2f", product)
            LooseCoins.amountSum = LooseCoins.amountSum + product
        }
        if Int(quartersQuantity.text!) == nil {
            quartersTotal.text = "$ 0.00"
        }
        else{
            billsSum = Int(quartersQuantity.text!)! + billsSum
            product = Float(quartersQuantity.text!)! * 0.25
            quartersTotal.text = String(format: "$ %03.2f", product)
            LooseCoins.amountSum = LooseCoins.amountSum + product
        }
        if Int(dimesQuantity.text!) == nil {
            dimesTotal.text = "$ 0.00"
        }
        else{
            billsSum = Int(dimesQuantity.text!)! + billsSum
            product = Float(dimesQuantity.text!)! * 0.10
            dimesTotal.text = String(format: "$ %03.2f", product)
            LooseCoins.amountSum = LooseCoins.amountSum + product
        }
        if Int(nickelsQuantity.text!) == nil {
            nickelsTotal.text = "$ 0.00"
        }
        else{
            billsSum = Int(nickelsQuantity.text!)! + billsSum
            product = Float(nickelsQuantity.text!)! * 0.05
            nickelsTotal.text = String(format: "$ %03.2f", product)
            LooseCoins.amountSum = LooseCoins.amountSum + product
        }
        if Int(penniesQuantity.text!) == nil {
            penniesTotal.text = "$ 0.00"
        }
        else{
            billsSum = Int(penniesQuantity.text!)! + billsSum
            product = Float(penniesQuantity.text!)! * 0.01
            penniesTotal.text = String(format: "$ %03.2f", product)
            LooseCoins.amountSum = LooseCoins.amountSum + product
        }
        totalQuantity.text = String(billsSum)
        totalAmount.text = String(format: "$ %03.2f", LooseCoins.amountSum)
        
        LooseCoins.overall = LooseCoins.amountSum + CoinRolls().getTotal() + Bills().getTotal()
        overallTotal.text = String(format: "Total: $ %03.2f", LooseCoins.overall)
    }
    
    func getTotal() -> Float{
        return LooseCoins.amountSum
    }
}
