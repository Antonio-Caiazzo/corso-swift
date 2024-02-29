import Foundation

let myAge = 21
let yourAge = 22

if myAge > yourAge {
    "Sono più anziano di te"
} else if myAge < yourAge {
    "Sono più giovane di te"
} else {
    "Abbiamo la stessa età"
}

let brotherAge = myAge + 2
let doubleMyAge = myAge * 2

// 1. unary prefix
let foo = !true
// 2. unary postfix
let name = Optional("Pippo")
type(of: name)
let unaryPostFix = name!
type(of: unaryPostFix)
// 3. binary infix
let result = 1 + 2
let names = "Foo" + " " + "Bar"
