import  Foundation

var prova = "Testo di pova"
print(prova)

let name: String? = nil
let greeting = "Hello, " + (name ?? "friend") + "!"
print(greeting)

// FORCE UNWRAPPING
let possibleNumber = "123"
let convertedNumber = Int(possibleNumber)

let number = convertedNumber!

guard let number = convertedNumber else {
    fatalError("Il numero è invalido")
}

// Implicity Unwrapped Optionals
let possibleString: String? = "Una stringa opzionale"
let forcedString: String = possibleString! // richiede lo scartamento esplicito

let assuntaStringa: String! = "Una stringa facoltativa implicitamente scartata."
let implicitString: String = assuntaStringa // scartato automaticamente



print("Ciao sono una modifica su devel")

print("Ciao sono una modifica su pippo")
