import Cocoa

struct Album {
    let title: String
    let artist: String
    let year: Int
    
    func printSummary() {
        print("\(title) (\(year)) by \(artist)")
    }
}


let red = Album(title: "Red", artist: "Taylor Swift", year: 2012)
let wings = Album(title: "Wings", artist: "BTS", year: 2016)

print(red.artist)
print(wings.artist)

red.printSummary()
wings.printSummary()


struct Employee {
    let name: String
    var vacationRemaining: Int
    
    mutating func takeVacation(days: Int) {
        if vacationRemaining > days {
            vacationRemaining -= days
            print("I'm going on vacation!")
            print("Days remaining: \(vacationRemaining)")
        } else {
            print("Oops! There aren't enough days remaining")
        }
    }
}

var archer = Employee(name: "Sterling Archer", vacationRemaining: 14)
archer.takeVacation(days: 5)
print(archer.vacationRemaining)

// Anche questo codice sarà valido
struct Employee2 {
    let name: String
    var vacationRemaining = 16
    
    mutating func takeVacation(days: Int) {
        if vacationRemaining > days {
            vacationRemaining -= days
            print("I'm going on vacation!")
            print("Days remaining: \(vacationRemaining)")
        } else {
            print("Oops! There aren't enough days remaining")
        }
    }
}
//Entrambi le inizializzazioni sono valide
let archer2 = Employee2(name: "Sterling Archer", vacationRemaining: 14)
let archer2_1 = Employee2(name: "Sterling Archer")


struct Employee3 {
    let name: String
    var vacationAllocatd = 14
    var vacationTaken = 0
    var vacationRemaining: Int {
        vacationAllocatd - vacationTaken
    }
}

var archer3 = Employee3(name: "Sterling Archer")
archer3.vacationTaken += 4
print(archer3.vacationRemaining)
archer3.vacationTaken += 4
print(archer3.vacationRemaining)



struct Employee4 {
    let name: String
    var vacationAllocated = 14
    var vacationTaken = 0
    var vacationRemaining: Int {
        get {
            vacationAllocated - vacationTaken
        }
        
        set {
            vacationAllocated = vacationTaken + newValue
        }
    }
}

var archer4 = Employee4(name: "Starling Archer")
archer4.vacationTaken += 4
print(archer4.vacationAllocated)
archer4.vacationRemaining = 5
print(archer4.vacationAllocated)


struct Game {
    var score = 0 {
        didSet {
            print("Score is now \(score)")
        }
    }
}

var game = Game()
game.score += 10
game.score -= 3
game.score += 1


struct App {
    var contacts = [String]() {
        willSet {
            print("Current value is \(contacts)")
            print("New value will be: \(newValue)")
        }
        
        didSet {
            print("There are now \(contacts.count)")
            print("Old value was \(oldValue)")
        }
    }
}

var app = App()
app.contacts.append("Adrian E")
app.contacts.append("Allen W")
app.contacts.append("Ish S")


var numero: Int
var pippo: App


struct Player {
    let name: String
    let number: Int
    
    init(name: String, number: Int) {
        self.name = name
        self.number = number
    }
}


struct Player2 {
    let name: String
    let number: Int
    
    init(name: String) {
        self.name = name
        number = Int.random(in: 1...99)
    }
}

let player = Player2(name: "Megan R")
print(player.number)


struct Employee5 {
    var name: String
    var yearsActive = 0
}

extension Employee5 {
    init() {
        self.name = "Anonymous"
        print("Creating an anonymous employee…")
    }
}

// creating a named employee now works
let roslin = Employee5(name: "Laura Roslin")

// as does creating an anonymous employee
let anon = Employee5()
