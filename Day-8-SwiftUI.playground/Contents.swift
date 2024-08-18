import Cocoa

func printTimesTables(for number: Int, end: Int = 12) {
    for i in 1...end {
        print("\(i) x \(number) is \(i * number)")
    }
}

printTimesTables(for: 4)
printTimesTables(for: 4, end: 2)


enum PasswordError: Error {
    case short, obvious
}

func checkPassword(_ password: String) throws -> String {
    if password.count < 5 {
        throw PasswordError.short
    }
    
    if password == "12345" {
        throw PasswordError.obvious
    }
    
    if password.count < 8 {
        return "OK"
    } else if password.count < 10 {
        return "Good"
    }
    else {
        return "Excellent"
    }
}

let string = "12345"

do {
    let result = try checkPassword(string)
    print("Password rating: \(result)")
} catch PasswordError.short {
    print("Please use a longer password.")
} catch PasswordError.obvious {
    print("I have the same combination on my luggage.")
} catch {
    print("Errore \(error.localizedDescription)")
}

enum SquareError: Error {
    case outOfBounds, noRoot
}

func square(_ number: Int) throws -> Int {
    if number < 1 || number > 10000 {
        throw SquareError.outOfBounds
    } else {
        for i in 1...number {
            if i * i == number {
                return i
            } else if i * i > number {
                break
            }
        }
        throw SquareError.noRoot
    }
}

let number = 9999

do {
    let result = try square(number)
    print(result)
} catch SquareError.noRoot {
    print("Non c'è una radice quadrata intera")
} catch SquareError.outOfBounds {
    print("Puoi inserire solo i numeri compresi tra 1 e 10000")
} catch {
    print("Errore \(error.localizedDescription)")
}
