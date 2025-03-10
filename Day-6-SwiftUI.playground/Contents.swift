import Cocoa

let platforms = ["iOS", "macOS", "tvOS", "watchOS", "visionOS"]
var users: [String: String] = ["Italia" : "Roma", "Inghilterra": "Londra"]
var books: Set<String> = Set(["Musk", "Jobs"])

for platform in platforms {
    print("Swift works great on \(platform)")
}

for user in users {
    print("Nazione: \(user.key)\nCapitale: \(user.value)\n")
}

for book in books {
    print("The best book is: \(book)")
}

for i in 1...12 {
    print("5 x \(i) is \(5 * i)")
}

for i in 1...12 {
    print("The \(i) times table:")
    
    for j in 1...12 {
        print(" \(j) x \(i) is \(j * i)")
    }
    print()
}

for i in 1...5 {
    print("Counting drom 1 through 5: \(i)")
}

print()

for i in 1..<5 {
    print("Counting 1 up to 5: \(i)")
}

// Se non utilizzo la variabile nel ciclo posso usare _
var lyric = "Haters gonna"

for _ in 1...5 {
    lyric += " hate"
}

print(lyric)


let names = ["Sterling", "Cyril", "Lana", "Ray", "Pam"]

for _ in names {
    print("[CENSORED] is a secret agent!")
}

print(names[0])
print(names[1...3])
print(names[1...])


var contdown = 10

while contdown > 0 {
    print("\(contdown)")
    contdown -= 1
}

print("Blast off!")


let id = Int.random(in: 1...1000)
let amount = Double.random(in: 0...1)

print("\(id) \(amount)")

var roll = 0

while roll != 20 {
    roll = Int.random(in: 1...20)
    print("I rolled a \(roll)")
}

print("Critical hit!")

let filenames = ["me.jpg", "work.txt", "sophie.jpg", "logo.psd"]

for filename in filenames {
    if filename.hasSuffix(".jpg") == false {
        continue
    }
    
    print("Founf picture: \(filename)")
}

let number1 = 4
let number2 = 14
var multiples = [Int]()

for i in 1...100_000{
    if i.isMultiple(of: number1) && i.isMultiple(of: number2){
        multiples.append(i)
        
        if multiples.count == 10 {
            break
        }
    }
}

print(multiples)


let options = ["up", "down", "left", "right"]
let secretCombination = ["up", "up", "right"]

// mi consente una volta trovata la combinazione di uscire da tutti i cicli contemporaneamente
outerLoop: for option1 in options {
    for option2 in options {
        for option3 in options {
            print("In loop")
            let attempt = [option1, option2, option3]
            
            if attempt == secretCombination {
                print("The combination is \(attempt)")
                break outerLoop
            }
        }
    }
}

for i in 1...100 {
    if i.isMultiple(of: 3) && i.isMultiple(of: 5) {
        print("FizzBuzz")
    } else if i.isMultiple(of: 3) {
        print("Fizz")
    } else if i.isMultiple(of: 5) {
        print("Buzz")
    } else {
        print("\(i)")
    }
}
