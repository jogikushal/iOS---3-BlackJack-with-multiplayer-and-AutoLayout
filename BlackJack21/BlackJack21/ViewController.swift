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
    
    @IBOutlet weak var nextButton: UIButton!
    
    
    var players : [Player] = [Player]()
    var dealer : Dealer = Dealer(dname: "dealer", dhands: Hand())
    var playingPlayer = 0
    var shoe :[Card] = []
    override func viewDidLoad() {
        super.viewDidLoad()
        nextButton.enabled = false
        standButton.enabled = false
        hitButton.enabled = false
        dealButton.enabled = false
        players.append(Player(pname: "1", pmoney: 100, phands: Hand())) //Player
        players.append(Player(pname: "2", pmoney: 100, phands: Hand())) // AI
        
        var mydeck = Deck().gdeck() + Deck().gdeck() + Deck().gdeck()
        shoe = Deck().shuffle(mydeck)
        
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    
    
    
    @IBAction func nextPressed(sender: AnyObject) {
        
            /*   let newCardView3 : UIView = helper.createCardSubView(x + (CGFloat(0)*xoffSet) , y:y,width:width1,height:height1,imageName : "back")
            parentView.addSubview(newCardView3)*/
            clear()
            nextButton.enabled = false
        
    }
    
    func clear(){
        for j in 0...1 {
        players[j].hands.bet = 0
        players[j].hands.cards = []
        dealer.hands.cards = []
        }
        for subUIView in playerView.subviews as [UIView] {
            if (subUIView.tag == 100){
            subUIView.removeFromSuperview()
            }
          
        }
        for subUIView in dealerHandView.subviews as [UIView] {
            if (subUIView.tag == 100){
                subUIView.removeFromSuperview()
            }

        }
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
        standButton.enabled = true
        for j in 1...2{
            var a = shoe.removeLast()
            players[playingPlayer].hands.cards.append(a)
            showCards(playerView, currentView: pCard, isPlayer: true)
        }
        for j in 1...2{
            var a = shoe.removeLast()
            players[1].hands.cards.append(a)
            showCards(playerView, currentView: aCard, isPlayer: true)
        }
        
        
        var b = shoe.removeLast()
        dealer.hands.cards.append(b)
        showCards(dealerHandView, currentView: dealerCard, isPlayer: false)
        
        dealButton.enabled = false
    }
    
    
    @IBAction func standButtonPressed(sender: AnyObject) {
        print("stand pressed")
        nextButton.enabled = true
        standButton.enabled = false
        hitButton.enabled = false
        dealerPick()
        aiPick()
        win()
        
        players[playingPlayer].hands.bet = 0
        players[playingPlayer].hands.cards = []
      //  showCards(playerView, currentView: pCard, isPlayer: true)
    //    dealer.hands.cards = []
    }
   
    
    
    @IBAction func hitButtonPressed(sender: AnyObject) {
        print("hit pressed")
        var a = shoe.removeLast()
        players[playingPlayer].hands.cards.append(a)
        showCards(playerView, currentView: pCard, isPlayer: true)
        
        if players[playingPlayer].hands.score > 21 {
            aiPick()
            var d = shoe.removeLast()
            
            dealer.hands.cards.append(d)
            showCards(dealerHandView, currentView: dealerCard, isPlayer: false)
            win()
            
        }
    }
    
    func dealerPick() {
        if dealer.hands.score < 16{
            var d = shoe.removeLast()
            
            dealer.hands.cards.append(d)
            showCards(dealerHandView, currentView: dealerCard, isPlayer: false)
            if dealer.hands.score > 21{
                //dealerBusted()
                win()
            }
            dealerPick()
        }
    }
    
    func aiPick(){
        if players[1].hands.score < 16{
            var d = shoe.removeLast()
            
            players[1].hands.cards.append(d)
            showCards(playerView, currentView: aCard, isPlayer: true)
            
            aiPick()
        }
        
    }
    
    
    func showCards(parentView : UIView, currentView :UIView, isPlayer: Bool){
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
        if(isPlayer){
            if (currentView == aCard){
                playingPlayer = 1
            }
            for i in players[playingPlayer].hands.cards{
        
                let newCardView : UIView = helper.createCardSubView(x + (CGFloat(j++)*xoffSet) , y:y,width:width1,height:height1,imageName : "\(i.rank.values.r)\(i.suite.rawValue)")
                parentView.addSubview(newCardView)
                    newCardView.tag = 100
            }
            playingPlayer = 0
        }
            
        else{
            if(dealer.hands.cards.count == 1){
                for k in dealer.hands.cards{
                    let newCardView : UIView = helper.createCardSubView(x + (CGFloat(j++)*xoffSet) , y:y,width:width1,height:height1,imageName : "\(k.rank.values.r)\(k.suite.rawValue)")
                    parentView.addSubview(newCardView)
                    newCardView.tag = 100
                }
                let newCardView1 : UIView = helper.createCardSubView(x + (CGFloat(j++)*xoffSet) , y:y,width:width1,height:height1,imageName : "back")
                parentView.addSubview(newCardView1)
                newCardView1.tag = 100
            } else{
                for k in dealer.hands.cards{
                    let newCardView2 : UIView = helper.createCardSubView(x + (CGFloat(j++)*xoffSet) , y:y,width:width1,height:height1,imageName : "\(k.rank.values.r)\(k.suite.rawValue)")
                    parentView.addSubview(newCardView2)
                    newCardView2.tag = 100
                }
            }
            
        }
    }
    
    
    
    
    func win() {
        standButton.enabled = false
        hitButton.enabled = false
        nextButton.enabled = true
        if players[playingPlayer].hands.score > dealer.hands.score && (players[playingPlayer].hands.score < 21 || players[playingPlayer].hands.score == 21){
            var alert = UIAlertController(title: "Win", message: "Player Wins", preferredStyle: UIAlertControllerStyle.Alert)
            alert.addAction(UIAlertAction(title: "Next", style: UIAlertActionStyle.Default, handler: nil))
            self.presentViewController(alert, animated: true, completion: nil)
        } else if dealer.hands.score > players[playingPlayer].hands.score && (dealer.hands.score < 21 || dealer.hands.score == 21){
            var alert = UIAlertController(title: "Unlucky!!", message: "Player \(players[playingPlayer].name) lose", preferredStyle: UIAlertControllerStyle.Alert)
            alert.addAction(UIAlertAction(title: "Next", style: UIAlertActionStyle.Default, handler: nil))
            self.presentViewController(alert, animated: true, completion: nil)
        }  else if dealer.hands.score == players[playingPlayer].hands.score {
            var alert = UIAlertController(title: "Push", message: "", preferredStyle: UIAlertControllerStyle.Alert)
            alert.addAction(UIAlertAction(title: "Next", style: UIAlertActionStyle.Default, handler: nil))
            self.presentViewController(alert, animated: true, completion: nil)
        } else if dealer.hands.score > 21 {
            var alert = UIAlertController(title: "Dealer Busted", message: "Player Wins", preferredStyle: UIAlertControllerStyle.Alert)
            alert.addAction(UIAlertAction(title: "Next", style: UIAlertActionStyle.Default, handler: nil))
            self.presentViewController(alert, animated: true, completion: nil)
            //  let pcards = players[playingPlayer].hands.cards
            players[playingPlayer].money += players[playingPlayer].hands.bet
        } else if players[playingPlayer].hands.score > 21{
            var alert = UIAlertController(title: "Busted", message: "Player Busted", preferredStyle: UIAlertControllerStyle.Alert)
            alert.addAction(UIAlertAction(title: "Next", style: UIAlertActionStyle.Default, handler: nil))
            self.presentViewController(alert, animated: true, completion: nil)
            //  let pcards = players[playingPlayer].hands.cards
            players[playingPlayer].money -= players[playingPlayer].hands.bet
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

