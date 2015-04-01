

import Foundation

class Player {
    
    var name:String
    var money:Int = 100
    var hands:Hand
    
    init(var pname:String,var pmoney:Int,var phands:Hand) {
        name = pname
        money = pmoney
        hands = phands
        //      hands.append(Hand())
    }
    
}