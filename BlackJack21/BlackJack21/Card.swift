

import Foundation

struct Card {
    
    /*   var rank: Rank
    var suite: Suite
    init(Rank: Int , Suite: String){
    self.rank = Rank
    self.suite = Suite
    }*/
    enum Suite: Character{
        case Spades = "♠", Hearts = "♡", Diamonds = "♢", Clubs = "♣"
    }
    enum Rank: Int {
        case Two = 2, Three, Four, Five, Six, Seven, Eight, Nine, Ten
        case Jack, Queen, King, Ace
        struct Values{
            let r: String, first: Int, second: Int?
        }
        var values: Values{
            switch self {
            case .Ace:
                return Values(r: "A", first: 11, second: 1)
            case .Jack:
                return Values(r: "J", first: 10, second: nil)
            case .King:
                return Values(r: "K", first: 10, second: nil)
            case .Queen:
                return Values(r: "Q", first: 10, second: nil)
            default:
                return Values(r: toString(self.rawValue), first: self.rawValue, second: nil)
            }
        }
    }
    let rank : Rank
    let suite : Suite
    
    
    //   let rankd: Rank, suited: Suite
    //   var description: String {
    //     var output = "\(rankd.values.first)\(suited.rawValue)"
    //    return output
}
