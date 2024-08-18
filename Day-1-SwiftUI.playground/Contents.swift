import Cocoa

var greeting = "Hello, playground"

var name = "Tony"
name = "Sosa"

let character = "Daphne"

var playerName = "Roy"
print(playerName)

playerName = "Dani"
print(playerName)

let bestFilm = "Interstellar"
let result = "You Win!😎"
let filename = "file.jpg"
let quote = "Then he tapped a sign saying \"Belive\" and walked away"
let movie = """
A day in the
life of on 
Apple engineer
"""

let bestFilmLength = bestFilm.count
print(bestFilmLength)

print(result.uppercased())
print(filename.hasPrefix("file"))
print(filename.hasSuffix(".jpg"))

let score = 10
let reallyBig = 100_000_000

let lowerScore = score - 2
let higherScore = score + 10
let doubledScore = score * 2
let squaredScore = score * score
let halvedScore = score / 2
print(score)

var counter = 10
counter += 5
print(counter)
counter *= 2
print(counter)
counter -= 10
print(counter)
counter /= 2
print(counter)

let number = 120
print(number.isMultiple(of: 3))

let numbers = 0.1 + 0.2
print(numbers)

let a = 1
let b = 2.0
let c = a + Int(b)
