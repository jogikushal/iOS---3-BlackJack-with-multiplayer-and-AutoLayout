
import Foundation

class Deck {
    
    var cards:[Card]
    let ranks = [Card.Rank.Ace,Card.Rank.King,Card.Rank.Queen,Card.Rank.Jack,Card.Rank.Ten,Card.Rank.Nine,Card.Rank.Eight,Card.Rank.Seven,Card.Rank.Six,Card.Rank.Five,Card.Rank.Four,Card.Rank.Three,Card.Rank.Two]
    let suits = [Card.Suite.Spades, Card.Suite.Hearts, Card.Suite.Diamonds, Card.Suite.Clubs]
    init(){
        cards = []
    }
    
    func gdeck() -> [Card]
    {
        for rank in ranks{
            //   println("\(rank)")
            for suite in suits{
                //     println("\(suite)")
                cards.append(Card(rank : rank , suite : suite))
            }
        }
        
        return cards
        
    }
    func shuffle<C: MutableCollectionType where C.Index == Int>(var list: C) ->C {
        let count = countElements(list)
        for i in 0..<(count-1) {
            let j = Int(arc4random_uniform(UInt32(count - i))) + i
            swap(&list[i], &list[j])
        }
        return list
    }
    
}