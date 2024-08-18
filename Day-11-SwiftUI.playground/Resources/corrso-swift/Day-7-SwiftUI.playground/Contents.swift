import Cocoa

func showWelcome() {
    print("Welcome to my app!")
    print("By default This prints out a conversion")
    print("chart from centimeters to inches, but you")
    print("can also set a custom range if you want.")
}

showWelcome()

func printTimesTables(number: Int) {
    for i in 1...12 {
        print("\(i) * \(number) is \(i * number)")
    }
}

printTimesTables(number: 5)


func printTimesTablesSecondVersion(number: Int, end: Int) {
    for i in 1...end {
        print("\(i) * \(number) is \(i * number)")
    }
}

printTimesTablesSecondVersion(number: 2, end: 7)

let root = sqrt(169)
print(root)


func rollDice() -> Int {
    return Int.random(in: 1...6)
}

let result = rollDice()
print(result)


func areLettersIdentical(string1: String, string2: String) -> Bool {
    return string1.sorted() == string2.sorted()
}

//quando abbiamo una sola riga possiamo togliere il return
func areLettersIdenticalSecondVersion(string1: String, string2: String) -> Bool {
    string1.sorted() == string2.sorted()
}

print(areLettersIdentical(string1: "abc", string2: "bca"))


func pythagoras(a: Double, b: Double) -> Double {
    sqrt((a * a) + (b * b))
}

let c = pythagoras(a: 3, b: 4)
print(c)


func greet(name: String) -> String {
    let response = if name == "Taylor Swift" {
        "Oh wow!"
    } else {
        "Hello, \(name)"
    }
    return response
}

print(greet(name: "Tony"))
print(greet(name: "Taylor Swift"))

func greetSecondVersion(name: String) -> String {
    let response = name == "Taylor Swift" ? "Oh wow!" : "Hello, \(name)"
    return response
}

print(greetSecondVersion(name: "Tony"))
print(greetSecondVersion(name: "Taylor Swift"))


func getUser() -> (firstName: String, lastName: String) {
    (firstName: "Taylor", lastName: "Swift")
}

let user = getUser()
print("Name: \(user.firstName) \(user.lastName)")

func getUserSecondVersion() -> (firstName: String, lastName: String) {
    ("Taylor", "Swift")
}

let userSecondVersion = getUserSecondVersion()
print("Name: \(user.0) \(user.1)")


//possiamo anche copiare il valore della tupla nelle variabili
let (firstName, lastName) = getUserSecondVersion()
print("Name: \(firstName) \(lastName)")

//Se non siamo interessati ai successivi valori inseriamo _
let (firstname, _) = getUserSecondVersion()
print("Name \(firstName)")


func rollDiceSecondVersion(sides: Int, count: Int) -> [Int] {
    var rolls = [Int]()
    
    for _ in 1...count {
        let roll = Int.random(in: 1...sides)
        rolls.append(roll)
    }
    
    return rolls
}

let rolls = rollDiceSecondVersion(sides: 4, count: 7)
print(rolls)


func isUppercase(string: String) -> Bool {
    string == string.uppercased()
}

let string = "HELLO WORLD"
let risultato = isUppercase(string: string)
print(risultato)

func isUppercaseSecondVersion(_ string: String) -> Bool {
    string == string.uppercased()
}

let risultatoTest = isUppercaseSecondVersion(string)
print(risultatoTest)


func printTimesTablesSecondVersion(for number: Int) {
    for i in 1...12 {
        print("\(i) * \(number) is \(i * number)")
    }
}

printTimesTablesSecondVersion(for: 4)
