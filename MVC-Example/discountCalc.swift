//
//  DiscountCalc.swift
//  MVC-Example
//
//  Created by Maria Hernandez on 3/19/17.
//  Copyright © 2017 mariahernandez. All rights reserved.
//

import UIKit

extension Float{
    func roundTo(places:Int)->Float{
        let divisor = pow(10.0, Float(places))
        return (self*divisor).rounded()/divisor
    }
}

class DiscountCalc{
    //MARK: Variables
    var price:Float!
    var dollarsOff:Float!
    var discount:Float!
    var otherDiscount:Float!
    var tax:Float!
    var orginal:Float!
    var discountPrice:Float!
    
    var orginalPrice:Float{
        get{
            return (price + (price*tax)).roundTo(places: 2)
        }
        set {
            orginal = price + (price*tax)
        }
    }
    
    func calculatingDiscount()->Float{
        orginal = price + (price*tax)
        discountPrice = orginal - dollarsOff
        discountPrice = discountPrice - (discountPrice * discount)
        discountPrice = (discountPrice).roundTo(places: 2)
        return discountPrice
    }
    
    
    static let shared:DiscountCalc = DiscountCalc()

}
