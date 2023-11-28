import UIKit

enum Suit {
    case clubs
    case spades
    case diamonds
    case hearts
}

var cardInHand:Suit = .spades

func getFortune(card:Suit) -> String {
    let forturn:String
    switch card {
    case .clubs:
        forturn = "clubs"
    case .spades:
        forturn = "spades"
    case .diamonds:
        forturn = "diamonds"
    case .hearts:
        forturn = "hearts"
    }
    return forturn
}
