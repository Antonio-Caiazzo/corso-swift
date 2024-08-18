import Cocoa

let score = 85

if score > 80 {
    print("Great Job")
}

let speed = 88
let percentage = 85
let age = 18

if speed >= 88 {
    print("Where we're going we don't need roads.")
}

if percentage < 85 {
    print("Sorry, you failed the test.")
}

if age >= 18 {
    print("You're eligible to vote")
}

let ourName = "Dave Lister"
let friendName = "Arnold Rimmer"

if ourName < friendName {
    print("It's \(ourName) vs \(friendName)")
}

if ourName > friendName {
    print("It's \(friendName) vs \(ourName)")
}

var numbers = [1, 2, 3]

numbers.append(4)

if numbers.count > 3 {
    numbers.remove(at: 0)
}

print(numbers)

let country = "Canada"
if country == "Australia" {
    print("G'day!")
}

let name = "Taylor Swift"
if name != "Anonymous" {
    print("Welcome \(name)")
}

var username = "taylorswift13"
if username.isEmpty {
    username = "Anonymous"
}
print("Welcome \(username)")

enum Size: Comparable {
    case small, medium, large
}
//Ciò stamperà "true", perché smallviene prima largenell'elenco dei casi enum.
let first = Size.small
let second = Size.medium
print(first < second)


let Age = 16
if Age >= 18 {
    print("You can vote in the next election")
} else {
    print("Sorry, you're too young to vote")
}

let a = false
let b = true

if a {
    print("Code to run if a is true")
} else if b {
    print("Code to run if a is false but b is true")
} else {
    print("Code to run if both a and b are false")
}

enum TransportOption {
    case airplane, helicopter, bicycle, car, scooter
}

let trasport = TransportOption.airplane

if(trasport == .airplane || trasport == .helicopter) {
    print("Let's fly!")
} else if (trasport == .bicycle) {
    print("I hope there's a bike path…")
} else if (trasport == .car) {
    print("Time to get stuck in traffic.")
} else {
    print("I'm going to hire a scooter now!")
}


enum Weather {
    case sun, rain, wind, snow, unknown
}

let forecast = Weather.sun

switch forecast {
case .sun:
    print("It should be a nice day.")
case .rain:
    print("Pack an umbrella.")
case .wind:
    print("Wear something warm")
case .snow:
    print("School is cancelled.")
case .unknown:
    print("Our forecast generator is broken!")
}


let place = "Metropolis"

switch place {
case "Gotham":
    print("You're Batman!")
case "Mega-City One":
    print("You're Judge Dredd!")
case "Wakanda":
    print("You're Black Panther!")
default:
    print("Who are you?")
}


let day = 5
print("My true love gave to me…")

switch day {
case 5:
    print("5 golden rings")
    fallthrough
case 4:
    print("4 calling birds")
    fallthrough
case 3:
    print("3 French hens")
    fallthrough
case 2:
    print("2 turtle doves")
    fallthrough
default:
    print("A partridge in a pear tree")
}


let età = 18
let canVote = age >= 18 ? "Yes" : "No"

let hour = 23
print(hour > 12 ? "It's before noon" : "It's after noon")

let names = ["Jayne", "Kaylee", "Mal"]
let crewCount = names.isEmpty ? "No one" : "\(names.count) people"
print(crewCount)


enum Theme {
    case light, dark
}

let theme = Theme.dark
let background = theme == .dark ? "Black" : "White"
print(background)
