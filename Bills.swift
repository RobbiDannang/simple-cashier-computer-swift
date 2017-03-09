//
//  Bills.swift
//  Simple Cashier Computer
//
//  Created by Dianne Robbi on 2/9/17.
//  Copyright © 2017 RoadDeum. All rights reserved.
//

import UIKit

class Bills: UIViewController {
    
    @IBOutlet weak var hundredQuantity: UITextField!
    @IBOutlet weak var fiftyQuantity: UITextField!
    @IBOutlet var twentyQuantity: UITextField!
    @IBOutlet var tenQuantity: UITextField!
    @IBOutlet var fiveQuantity: UITextField!
    @IBOutlet var twoQuantity: UITextField!
    @IBOutlet var oneQuantity: UITextField!
    
    @IBOutlet var hundredTotal: UILabel!
    @IBOutlet var fiftyTotal: UILabel!
    @IBOutlet var twentyTotal: UILabel!
    @IBOutlet var tenTotal: UILabel!
    @IBOutlet var fiveTotal: UILabel!
    @IBOutlet var twoTotal: UILabel!
    @IBOutlet var oneTotal: UILabel!
    
    @IBOutlet var calculateBills: UIButton!
    
    @IBOutlet var totalQuantity: UILabel!
    @IBOutlet var totalAmount: UILabel!
    
    @IBOutlet public var overallTotal: UILabel!
    
    static var overall = Float(0)
    static var amountSum = Float(0)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        Bills.overall = Bills.amountSum + CoinRolls().getTotal() + LooseCoins().getTotal()
        overallTotal.text = String(format: "Total: $ %03.2f", Bills.overall)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool{
        hundredQuantity.resignFirstResponder()
        return true
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func buttonPressed(_ sender: UIButton) {
        var product = Float(0)
        var billsSum = 0
        
        if  Int(hundredQuantity.text!) == nil{
            Bills.amountSum = Float(0)
            hundredTotal.text = String(format: "$ %3.2f", product)
        }
        else{
            billsSum = Int(hundredQuantity.text!)!
            product = Float(billsSum) * 100
            hundredTotal.text = String(format: "$ %3.2f", product)
            Bills.amountSum = product
        }
        if Int(fiftyQuantity.text!) == nil {
            fiftyTotal.text = "$ 0.00"
        }
        else{
            billsSum = Int(fiftyQuantity.text!)! + billsSum
            product = Float(fiftyQuantity.text!)! * 50
            fiftyTotal.text = String(format: "$ %3.2f", product)
            Bills.amountSum = Bills.amountSum + product
        }
        if Float(twentyQuantity.text!) == nil {
            twentyTotal.text = "$ 0.00"
        }
        else{
            billsSum = Int(twentyQuantity.text!)! + billsSum
            product = Float(twentyQuantity.text!)! * 20
            twentyTotal.text = String(format: "$ %3.2f", product)
            Bills.amountSum = Bills.amountSum + product
        }
        if Int(tenQuantity.text!) == nil {
            tenTotal.text = "$ 0.00"
        }
        else{
            billsSum = Int(tenQuantity.text!)! + billsSum
            product = Float(tenQuantity.text!)! * 10
            tenTotal.text = String(format: "$ %3.2f",product)
            Bills.amountSum = product + Bills.amountSum
        }
        if Int(fiveQuantity.text!) == nil {
            fiveTotal.text = "$ 0.00"
        }
        else{
            billsSum = Int(fiveQuantity.text!)! + billsSum
            product = Float(fiveQuantity.text!)! * 5
            fiveTotal.text = String(format: "$ %3.2f", product)
            Bills.amountSum = product + Bills.amountSum
        }
        if Int(twoQuantity.text!) == nil {
            twoTotal.text = "$ 0.00"
        }
        else{
            billsSum = Int(twoQuantity.text!)! + billsSum
            product = Float(twoQuantity.text!)! * 2
            twoTotal.text = String(format: "$ %3.2f", product)
            Bills.amountSum = product + Bills.amountSum
        }
        if Int(oneQuantity.text!) == nil {
            oneTotal.text = "$ 0.00"
        }
        else{
            billsSum = Int(oneQuantity.text!)! + billsSum
            product = Float(oneQuantity.text!)!
            oneTotal.text = String(format: "$ %3.2f", product)
            Bills.amountSum = product + Bills.amountSum
        }
        totalQuantity.text = String(billsSum)
        totalAmount.text = String(format: "$ %03.2f", Bills.amountSum)
        Bills.overall = Bills.amountSum + CoinRolls().getTotal() + LooseCoins().getTotal()
        overallTotal.text = String(format: "Total: $ %03.2f", Bills.overall)
    }
    
    func getTotal() -> Float{
        return Bills.amountSum
    }
}

