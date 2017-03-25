//
//  CalculatorViewController.swift
//  
//
//  Created by Maria Hernandez on 2/27/17.
//  Copyright © 2017 mariahernandez. All rights reserved.
//

import UIKit

class CalculatorViewController: UIViewController, UITextFieldDelegate{

    let CalcData: DiscountCalc = DiscountCalc.shared
    
    //MARK: Properties
    @IBOutlet weak var priceLabel: UILabel!
    @IBOutlet weak var dollarsOffLabel: UILabel!
    @IBOutlet weak var discountLabel: UILabel!
    @IBOutlet weak var otherDiscountLabel: UILabel!
    @IBOutlet weak var taxLabel: UILabel!
    @IBOutlet weak var priceTextField: UITextField!
    @IBOutlet weak var dollarsOffTextField: UITextField!
    @IBOutlet weak var discountTextField: UITextField!
    @IBOutlet weak var otherDiscountTextField: UITextField!
    @IBOutlet weak var taxTextField: UITextField!
    @IBOutlet weak var originalPriceLabel: UILabel!
    @IBOutlet weak var discountPriceLabel: UILabel!
    
    var orginalPrice:Float!
    var discountPrice:Float!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Make Swipe Gestures
        let swipeLeft:UISwipeGestureRecognizer = UISwipeGestureRecognizer(target: self, action: #selector(handleSwipe))
        swipeLeft.direction = UISwipeGestureRecognizerDirection.left
        view.addGestureRecognizer(swipeLeft)
        
        //handleSwipe is a function down below..
        //#selector() selects and executes that function
        
        //Delegate values to self
        self.priceTextField.delegate = self
        self.dollarsOffTextField.delegate = self
        self.discountTextField.delegate = self
        self.otherDiscountTextField.delegate = self
        self.taxTextField.delegate = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    //Returns the keyboard
    func textView(textView: UITextField, shouldChangeTextInRange range: NSRange, replacementText text : String) -> Bool {
        if(text == "\n")
        {
            textView.resignFirstResponder()
            return false
        }
        return true
    }
    
    func textFieldDidEndEditing(_ textField: UITextField)
    {
        CalcData.price = Float(priceTextField.text!)
        CalcData.discount = Float(discountTextField.text!)
        CalcData.dollarsOff = Float(dollarsOffTextField.text!)
        CalcData.otherDiscount = Float(otherDiscountTextField.text!)
        CalcData.tax = Float(taxTextField.text!)
    }
    
    @IBAction func calculateButton(_ sender: UIButton) {
        
        discountPrice = CalcData.calculatingDiscount()
        orginalPrice = CalcData.orginalPrice
        
        discountPriceLabel.text = "Discount Price = $ \(discountPrice!)"
        originalPriceLabel.text = "Orginal Price = $ \(orginalPrice!)"
    }
    
    //Swipe Function
    func handleSwipe(_sender:UIGestureRecognizer){
        self.performSegue(withIdentifier: "showResults", sender: self)
    }
    
    //Enable Unwinding Other Views
    @IBAction func unwindToCalc(segue: UIStoryboardSegue){
        
    }
}
