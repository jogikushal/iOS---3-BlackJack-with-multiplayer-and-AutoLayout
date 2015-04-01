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
    
    var players : [Player] = [Player]()
    var playingPlayer = 0
    var shoe :[Card] = []
    override func viewDidLoad() {
        super.viewDidLoad()
        standButton.enabled = false
        hitButton.enabled = false
        dealButton.enabled = false
        players.append(Player(pname: "1", pmoney: 100, phands: Hand())) //Player
        players.append(Player(pname: "2", pmoney: 100, phands: Hand())) // AI
        
        var mydeck = Deck().gdeck() + Deck().gdeck() + Deck().gdeck()
        shoe = Deck().shuffle(mydeck)
        
        // Do any additional setup after loading the view, typically from a nib.
    }

    @IBAction func oneButtonPressed(sender: AnyObject) {
        print("one pressed")
        players[playingPlayer].money -= 1
        players[playingPlayer].hands.bet += 1
        self.betAmount.text = "\(players[playingPlayer].hands.bet)"
        self.playerMoney.text = "\(players[playingPlayer].money)"
        if(!dealButton.enabled){
            dealButton.enabled = true
        }
    }
    @IBAction func fiveButtonPressed(sender: AnyObject) {
        print("five pressed")
        players[playingPlayer].money -= 5
        players[playingPlayer].hands.bet += 5
        self.betAmount.text = "\(players[playingPlayer].hands.bet)"
        self.playerMoney.text = "\(players[playingPlayer].money)"
        if(!dealButton.enabled){
            dealButton.enabled = true
        }
    }
    
    @IBAction func dealButtonPressed(sender: AnyObject) {
        print("deal pressed")
        hitButton.enabled = true
    }
    
    @IBAction func standButtonPressed(sender: AnyObject) {
        print("stand pressed")
    }
   
    
    @IBAction func hitButtonPressed(sender: AnyObject) {
        print("hit pressed")
        var a = shoe.removeLast()
        players[playingPlayer].hands.cards.append(a)
        showCards(playerView, currentView: pCard)
    }
    
    
    
    func showCards(parentView : UIView, currentView :UIView){
        var xoffSet : CGFloat = 0
        var yoffSet : CGFloat = 0
        var currentStart = currentView.frame.size
        xoffSet = CGFloat(15)
    //    yoffSet = CGFloat(25)
        var j = 0
        var width1 = currentStart.width
        var height1 = currentStart.height
        var x = currentView.frame.origin.x
        var y = currentView.frame.origin.y
        
        let helper = ViewControllerHelper()
        //if(addAllCards){
        for i in players[playingPlayer].hands.cards{
        
                let newCardView : UIView = helper.createCardSubView(x + (CGFloat(j++)*xoffSet) , y:y,width:width1,height:height1,imageName : "\(i.rank.values.r)\(i.suite.rawValue)")
                parentView.addSubview(newCardView)
            }
        }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

