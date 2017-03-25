//
//  GraphView.swift
//  MVC-Example
//
//  Created by Maria Hernandez on 3/6/17.
//  Copyright © 2017 mariahernandez. All rights reserved.
//

import UIKit

extension CGContext {
    //Applies to all contexts that use the class
    func setFillColor(_ hex:Int) {
        //Mask different values of the hex code
        //0xFF0000 - Red
        //0x00FF00 - Green
        //0x0000FF - Blue
        
        let redColor:CGFloat = CGFloat((hex >> 16) & 0xFF)/255.0
        let greenColor:CGFloat = CGFloat((hex >> 8) & 0xFF)/255.0
        let blueColor:CGFloat = CGFloat(hex & 0xFF)/255.0
        
        setFillColor(red: redColor, green: greenColor, blue: blueColor, alpha:1.0)
    }
}

class GraphView: UIView {
    //Needed to share the values in all
    let CalcData:DiscountCalc = DiscountCalc.shared
    
    override func draw(_ rect: CGRect){
        let context:CGContext = UIGraphicsGetCurrentContext()!
        let context2:CGContext = UIGraphicsGetCurrentContext()!
        let screenWidth = UIScreen.main.bounds.width/2
        let screenHeight = UIScreen.main.bounds.height
        let leftGuide:CGFloat = 16.0
        //let rightGuide:CGFloat = -16.0
        let topGuide:CGFloat = 64.0 + 16.0 //72.00
        //let botGuide:CGFloat = screenHeight - 16.0
        
        //Draw Rectangle
        //context.setFillColor(red: 0.0, green: 1.0, blue: 1.0, alpha: 1.0)old point CG
        context.setFillColor(0xFF5A1A)
        context.fill(CGRect(x:leftGuide, y:topGuide, width:screenWidth-32.00, height:screenHeight-96.0))
        context2.setFillColor(0x00B293)
        context2.fill(CGRect(x:screenWidth, y:topGuide, width:screenWidth, height: screenHeight-96.0))
        //Draw Text
        let myText = "Discount Price = $\(CalcData.discountPrice!)"
        let subText = "Original Price = $\(CalcData.orginalPrice)"
        
        //Text Attributes
        let textAttributes = [NSFontAttributeName: UIFont(name: "Helvetica Bold", size: 16.0)!, NSForegroundColorAttributeName: UIColor(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)]
        
        myText.draw(at:CGPoint(x:leftGuide+16.0, y:topGuide+16.0),withAttributes: textAttributes)
        subText.draw(at:CGPoint(x:leftGuide + 16.0, y:topGuide+32.0), withAttributes: textAttributes)
    }
}
