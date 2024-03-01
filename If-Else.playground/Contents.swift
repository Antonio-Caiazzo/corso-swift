import Foundation

let myName = "Tony"
let myAge = 20
let yourName = "Foo"
let yourAge = 19

if myName == "Tony" && myAge == 30 {
    "Your name is \(myName) and age is 30"
} else if myAge == 20 {
    "I only guessed the age right"
} else {
    "Oops, ho sbagliato"
}

if (myName == "Tony" && myAge == 22) && (yourName == "Foo" || yourAge == 19) {
    "My name is Tony and I'm 20... AND... your name is Foo or you are 19"
} else {
    "Hmmm, non ha funzionato bene"
}
