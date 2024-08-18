import Cocoa

let name: String = "Tony"
let score: Double = 20

let playerName: String = "Pippo"
let luckyNumber: Int = 11
let pi: Double = 3.141
var isAuthenticated: Bool = true

var albums: [String] = ["Icon", "Red"]

var user: [String: String] = ["Italia" : "Roma", "Inghilterra": "Londra"]

var books: Set<String> = Set(["Musk", "Jobs"])

var team: [String] = [String]()
var steam: [String] = []
var teams = [String]()

enum UIStyle {
        case light, dark, system
}

var style = UIStyle.dark

let username: String

username = "pippo"

print(username)

let libri = ["pippo", "pluto", "paperino", "Tony", "Sosa", "pippo", "Sosa"]
print(libri.count)
let libriSet = Set(libri)
print(libriSet.count)
