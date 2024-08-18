import Cocoa

// GIORNO 3
var beatles = ["John", "Paul", "George", "Ringo"]
let numbers = [4, 8, 15, 16, 23, 42]
var temperatures = [25.3, 28.2, 26.4]

print(beatles[0])
print(numbers[1])
print(temperatures[2])

beatles.append("Adrian")

var scores = Array<Int>()
scores.append(100)
scores.append(80)
print(scores[1])

var albums = [String]()
albums.append("Red")
albums.append("Fearless")


let presidents = ["Bush", "Obama", "Trump", "Biden"]
let reversedPresidents = Array(presidents.reversed())
print(reversedPresidents)

let employee2 = [
    "name": "Taylor Swift",
    "job": "Singer",
    "location": "Nashville",
]

print(employee2["name", default: "Unknown"])
print(employee2["job", default: "Unknown"])
print(employee2["location", default: "Unknown"])

var heights = [String: Int]()
heights["Yao Ming"] = 229
heights["Shaquille O'Neal"] = 216
heights["LeBron James"] = 206
heights.removeValue(forKey: "Yao Ming")


let people = Set(["Denzel Washington", "Tom Cruise", "Nicolas Cage", "Sameuel L Jackson"])
print(people)
var people1 = Set<String>()
people1.insert("Tony")
people1.insert("Montana")
print(people1, people1.contains("Pippo"))

enum Weekday {
    case monday, tuesday, wednesday, thursday, friday
}

var day = Weekday.monday
day = .tuesday
day = .friday
print(Weekday.thursday)


//GIORNO 4
let surname: String = "Lasso"
var score: Double = 0

var albums2: [String] = ["Red", "Fearless"]
var user: [String: String] = ["id": "@twostraws"]
var books: Set<String> = Set(["The Bluest Eye", "Foundation"])
var cities = [String]()

let characters = ["Pippo", "Pluto", "Topolino", "Paperino", "Pippo", "Pluto"]
print(characters.count)
let noDuplicateCharacters = Set(characters)
print(noDuplicateCharacters.count)

// GIORNO 5
let score2 = 85
if score2 > 80 {
    print("Great job!")
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

var numbers2 = [1, 2, 3]
numbers2.append(4)
if numbers2.count > 3 {
    numbers2.remove(at: 0)
}
print(numbers2)


var username2: String = ""
if username2.isEmpty {
    username2 = "Anonymous"
    print(username2)
} else {
    print(username2)
}

enum Size: Comparable {
    case small, medium, large
}

let first = Size.small
let second = Size.large
print(first < second)


enum Weather {
    case sun, rain, wind, snow, unknown
}
let forecast = Weather.sun

switch forecast {
case .sun:
    print("It shuld be a nice day.")
case .rain:
    print("Pack an umbrella.")
case .wind:
    print("Wear something warm.")
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

let day2 = 5
print("Ny true love gave to me...")

switch day2 {
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

let age2 = 18
let canVote = age2 >= 18 ? "Yes" : "No"

enum Theme {
    case light, dark
}

let theme = Theme.dark

let background = theme == .dark ? "black" : "white"
print(background)


let sayHello = { (name: String) -> String in
    "Hi \(name)"
}


print(sayHello("p"))

class User {
    let id: Int

    init(id: Int) {
        self.id = id
        print("User \(id): I'm alive!")
    }

    deinit {
        print("User \(id): I'm dead!")
    }
}

for i in 1...3 {
    let user = User(id: i)
    print("User \(user.id): I'm in control!")
}

