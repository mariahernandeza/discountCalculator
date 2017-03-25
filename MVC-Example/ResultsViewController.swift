//
//  ResultsViewController.swift
//  MVC-Example
//
//  Created by Maria Hernandez on 2/27/17.
//  Copyright © 2017 mariahernandez. All rights reserved.
//

import UIKit

class ResultsViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        let swipeRight:UISwipeGestureRecognizer = UISwipeGestureRecognizer(target: self, action: #selector(handleSwipe))
        swipeRight.direction = UISwipeGestureRecognizerDirection.right
        view.addGestureRecognizer(swipeRight)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //Swipe Function
    func handleSwipe(_ sender:UISwipeGestureRecognizer){
        self.performSegue(withIdentifier: "unwindToCalc", sender: self)
    }
}
