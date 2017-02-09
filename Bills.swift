//
//  Bills.swift
//  OTGcashier
//
//  Created by Dianne Robbi on 1/20/17.
//  Copyright © 2017 RoadDeum. All rights reserved.
//

import UIKit

class Bills: UIViewController {
    
    @IBOutlet var hundredQuantity: UITextField!
    @IBOutlet var fiftyQuantity: UITextField!
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
    
    public var overall = Float(0)
    public var amountSum = Float(0)

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func buttonPressed(_ sender: UIButton) {
        var product = Float(0)
        var billsSum = 0
        
        if  Int(hundredQuantity.text!) == nil{
            amountSum = Float(0)
            hundredTotal.text = String(format: "$ %3.2f", product)
        }
        else{
            billsSum = Int(hundredQuantity.text!)!
            product = Float(billsSum) * 100
            hundredTotal.text = String(format: "$ %3.2f", product)
            amountSum = product
        }
        if Int(fiftyQuantity.text!) == nil {
            fiftyTotal.text = "$ 0.00"
        }
        else{
            billsSum = Int(fiftyQuantity.text!)! + billsSum
            product = Float(fiftyQuantity.text!)! * 50
            fiftyTotal.text = String(format: "$ %3.2f", product)
            amountSum = amountSum + product
        }
        if Float(twentyQuantity.text!) == nil {
            twentyTotal.text = "$ 0.00"
        }
        else{
            billsSum = Int(twentyQuantity.text!)! + billsSum
            product = Float(twentyQuantity.text!)! * 20
            twentyTotal.text = String(format: "$ %3.2f", product)
            amountSum = amountSum + product
        }
        if Int(tenQuantity.text!) == nil {
            tenTotal.text = "$ 0.00"
        }
        else{
            billsSum = Int(tenQuantity.text!)! + billsSum
            product = Float(tenQuantity.text!)! * 10
            tenTotal.text = String(format: "$ %3.2f",product)
            amountSum = product + amountSum
        }
        if Int(fiveQuantity.text!) == nil {
            fiveTotal.text = "$ 0.00"
        }
        else{
            billsSum = Int(fiveQuantity.text!)! + billsSum
            product = Float(fiveQuantity.text!)! * 5
            fiveTotal.text = String(format: "$ %3.2f", product)
            amountSum = product + amountSum
        }
        if Int(twoQuantity.text!) == nil {
            twoTotal.text = "$ 0.00"
        }
        else{
            billsSum = Int(twoQuantity.text!)! + billsSum
            product = Float(twoQuantity.text!)! * 2
            twoTotal.text = String(format: "$ %3.2f", product)
            amountSum = product + amountSum
        }
        if Int(oneQuantity.text!) == nil {
            oneTotal.text = "$ 0.00"
        }
        else{
            billsSum = Int(oneQuantity.text!)! + billsSum
            product = Float(oneQuantity.text!)!
            oneTotal.text = String(format: "$ %3.2f", product)
            amountSum = product + amountSum
        }
        totalQuantity.text = String(billsSum)
        totalAmount.text = String(format: "$ %03.2f", amountSum)
        print("0 is " + String(amountSum))
        overall = amountSum + CoinRolls().getTotal() + LooseCoins().getTotal()
        overallTotal.text = String(format: "Total: $ %03.2f", overall)
    }
    
    func getTotal() -> Float{
        return amountSum
    }
}

