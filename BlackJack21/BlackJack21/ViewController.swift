//
//  ViewController.swift
//  BlackJack21
//
//  Created by Kushal Jogi on 3/29/15.
//  Copyright (c) 2015 Kushal Jogi. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    
    @IBOutlet weak var dealerHandView: UIView!
    
    
    @IBOutlet weak var dealerCard: UIImageView!
    
    @IBOutlet weak var playerView: UIView!
    
    @IBOutlet weak var pCard: UIImageView!
    
    @IBOutlet weak var aCard: UIImageView!
    
   
    @IBOutlet weak var oneButton: UIButton!
    
    
    @IBOutlet weak var fiveButton: UIButton!
    
    @IBOutlet weak var dealButton: UIButton!
    
    @IBOutlet weak var standButton: UIButton!
    
    @IBOutlet weak var hitButton: UIButton!
    
    @IBOutlet weak var playerMoney: UILabel!
    
    @IBOutlet weak var betAmount: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    @IBAction func oneButtonPressed(sender: AnyObject) {
    }

    @IBAction func fiveButtonPressed(sender: AnyObject) {
    }
    
    @IBAction func dealButtonPressed(sender: AnyObject) {
    }
    
    @IBAction func standButtonPressed(sender: AnyObject) {
    }
   
    
    @IBAction func hitButtonPressed(sender: AnyObject) {
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

