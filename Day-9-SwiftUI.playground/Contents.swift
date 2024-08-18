import Cocoa

func greetUser() {
    print("Hi there!")
}

greetUser()

var greetCopy = greetUser
greetCopy()


let sayHello = {
    print("Hi there!")
}

sayHello()

let sayHelloSecondVersion = { (name: String) -> String in
    "Hi \(name)"
}

print(sayHelloSecondVersion("pippo"))


func getUserData(for id: Int) -> String {
    if id == 1989 {
        return "Taylor Swift"
    } else {
        return "Anonymous"
    }
}

let data: (Int) -> String = getUserData
let user = data(1989)
print(user)

let team = ["Gloria", "Suzanne", "Piper", "Tiffany", "Tasha"]
let sortedTeam = team.sorted()
print(sortedTeam)


func captainFirstSorted(name1: String, name2: String) -> Bool {
    if name1 == "Suzanne" {
        return true
    } else if name2 == "Suzanne" {
        return false
    }
    
    return name1 < name2
}

let captainFirstTeam = team.sorted(by: captainFirstSorted)
print(captainFirstTeam)

let captainFirstTeamSecondVersion = team.sorted(by: { (name1: String, name2: String) -> Bool in
    if name1 == "Suzanne" {
        return true
    } else if name2 == "Suzanne" {
        return false
    }
    
    return name1 < name2
})

print(captainFirstTeamSecondVersion)


let payment = { (user: String) in
    print("Paying \(user)")
}

payment("Tony")

let pagamento = { (user: String) -> Bool in
    print("Paying \(user)")
    return true
}

print(pagamento("pippo"))

let paymentAnonymous = { () -> Bool in
    print("Paying an anonymous person")
    return true
}

paymentAnonymous()

let captainFirstTeam3 = team.sorted { name1, name2 in
    if name1 == "Suzanne" {
        return true
    } else if name2 == "Suzanne" {
        return false
    }
    
    return name1 < name2
}

print(captainFirstTeam3)


let captainFirstTeam4 = team.sorted {
    if $0 == "Suzanne" {
        return true
    } else if $1 == "Suzanne" {
        return false
    }
    
    return $0 < $1
}

print(captainFirstTeam4)

let reverseTeam = team.sorted {
    return $0 > $1
}

print(reverseTeam)


let reverseTeam2 = team.sorted { $0 > $1 }
print(reverseTeam2)

let tOnly = team.filter { $0.hasPrefix("T") }
print(tOnly)

let uppercaseTeam = team.map { $0.uppercased() }
print(uppercaseTeam)


func animate(duration: Double, animations: () -> Void, to: () -> Void) {
    print("Starting a \(duration) second animation...")
    animations()
    to()
}
// non è consigliato scriverlo in questo modo
animate(duration: 3, animations: {
    print("Fade out the image")
}, to: {
    print("print to")
})
// meglio scriverlo in questo modo:
animate(duration: 4, animations: {
    print("Fade out the image")
}) {
    print("to")
}

func makeArray(size: Int, using generator: () -> Int) -> [Int] {
    var numbers = [Int]()
    
    for _ in 0..<size {
        let newNumber = generator()
        numbers.append(newNumber)
    }
    
    return numbers
}

let rolls = makeArray(size: 6) {
    Int.random(in: 1...90)
}

print(rolls)

// questa funzionalità funziona anche con funzioni dedicate
func generateNumber() -> Int {
    Int.random(in: 1...90)
}

let newRolls = makeArray(size: 50, using: generateNumber)
print(newRolls)


func doImportantWork(first: () -> Void, second: () -> Void, third: () -> Void) -> Void {
    print("About to start first work")
    first()
    print("About to start second work")
    second()
    print("About to start third work")
    third()
    print("Done")
}

doImportantWork {
    print("This is the first work")
} second: {
    print("This is the second work")
} third: {
    print("This is the third work")
}


func tendGarden(activities: () -> Void) {
    print("I love gardening")
    activities()
}
tendGarden {
    print("Let's grow some roses!")
}

let luckyNumbers = [7, 4, 38, 21, 16, 15, 12, 33, 31, 49]
let exercise = luckyNumbers.filter { $0.isMultiple(of: 2) == false } .sorted() .map { "\($0) is a lucky number"}

exercise.forEach {
    print($0)
}

