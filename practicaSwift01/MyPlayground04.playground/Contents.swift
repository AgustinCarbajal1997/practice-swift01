import Foundation

//variables opcionales

let myStringNumber = "100"
let myIntNumber = Int(myStringNumber)

let myWrongStringNumber = "asdad"
let myWrongIntNumber: Int? = Int(myWrongStringNumber)

var myOptionString: String?
//print(myOptionString!)



//optional bindings - enlaces opcionales

var myOptionString1: String?
myOptionString1 = "Hola mundo"

// desempaquetado opcional - mas usado y menos codigo
if let myString = myOptionString1 {
    // solo se ejecuta si es distinto de nil
    print(myString)
}else {
    print("variable nula")
}

//desempaquetado forzado
if myOptionString1 != nil {
    print(myOptionString1!)
}


//cadanas opcionales - optional chaning -  nos permite acceder a valores que estan anidados

class Student {
    var name: String?
    var book: Book?
}

class Book {
    var pages: Int?
}

let myStudent = Student()
myStudent.name = "Agustin"
let myBook = Book()
myBook.pages = 15
myStudent.book = myBook

if let pages = myStudent.book?.pages, let name = myStudent.name {
    print("el libro de \(name) tiene \(pages) paginas")
}else{
    print("el libro no tiene paginas")
}


// guard ley o salida de sentencia rapida

var myOptionalStringGuard: String?

func myFunction (){
    guard let myString = myOptionalStringGuard else {
        return
    }
    print("El valor de mi guard let es \(myString)")
}
myFunction()
// manejo de errores
func sum(firstNumber:Int?, secondNumber:Int?)throws -> Int {
    if firstNumber == nil {
        throw SumError.firstNumberNil
    }else if secondNumber == nil{
        throw SumError.secondNumberNil
    }else if firstNumber! < 0 || secondNumber! < 0 {
        throw SumError.numberNegative(firstNumber: firstNumber!, secondNumber: secondNumber!)
    }
    
    return firstNumber! + secondNumber!
}

//definicion de tipos de errores
enum SumError:Error {
    case firstNumberNil
    case secondNumberNil
    case numberNegative(firstNumber: Int, secondNumber: Int)
}

//propagacion de errores

do {
    print(try sum(firstNumber: nil, secondNumber: 50))
}catch SumError.firstNumberNil{
    print("el primer numero es nil")
}
catch SumError.secondNumberNil{
    print("el segundo numero es nil")
}
catch SumError.numberNegative(let firstNumber, let secondNumber){
    print("algun numero es negativo \(firstNumber) o \(secondNumber)")
}
print(try sum(firstNumber: 100, secondNumber: 50))


// type casting - validacion de datos

let myString = "agustin"
let myInt = 12

class MyClass {
    var name: String!
    var age: Int!
}

let myClass = MyClass()
myClass.name = "Claudio"
myClass.age = 35

let array: [Any] = [myString, myInt, myClass]

for item in array {
    if item is String {
        //downcasting transformacion de any a string
        let myItemString = item as! String
        print("item es de tipo string")
    }else if item is Int {
        //downcasting transformacion de any a string
        let myItemString = item as! Int
        print("item es de tipo int")
    }else if item is MyClass {
        //downcasting transformacion de any a string
        let myItemClass = item as! MyClass
        print("item es de tipo class")
    }
}

for item in array {
    if let myItemString = item as? String {
        //downcasting transformacion de any a string
        print("item es de tipo string \(myItemString)")
    }else if let myItemInt = item as? Int {
        //downcasting transformacion de any a string
        print("item es de tipo int \(myItemInt)")
    }else if let myItemClass = item as? MyClass {
        //downcasting transformacion de any a string
        print("item es de tipo class \(myItemClass.name!)")
    }
}

// piezas anidadas

struct ChessPiece {
    
    let color: Color
    let type: PieceType
        
    enum Color: String {
        case white = "Blanco"
        case black = "Negro"
    }
    
    enum PieceType: String {
        case king = "Rey"
        case queen = "Reina"
        case rock = "Torre"
        case bishop = "Alfil"
        case knight = "Caballo"
        case pawn = "Peon"
        struct Number {
            let number: Int
        }
        var number: Number {
            switch self {

            case .king:
                return Number(number: 1)
            case .queen:
                return Number(number: 1)
            case .rock:
                return Number(number: 2)
            case .bishop:
                return Number(number: 2)
            case .knight:
                return Number(number: 2)
            case .pawn:
                return Number(number: 8)
            }
        }
        
        }
    var description: String {
        return "Las \(type.number.number) piezas es de color \(color.rawValue) y de tipo \(type.rawValue)"
    }
}

let myPiece = ChessPiece(color: .black, type: .rock)
print(myPiece.description)

// extensiones

let myMeters: Double = 5000

func metersToKm(meters: Double) -> Double {
    return meters / 1000
}

print(metersToKm(meters: myMeters))

extension Double {
    
    var km: Double {
        return self / 1000
    }
    
    var m: Double {
        return self
    }
    
    var cm: Double {
        return self * 100
    }
}

print(myMeters.km)
print(myMeters.m)

// protocolosss - obliga a clase funciones y enum a tener ciertos metodos y funciones - es un modelo que luego se va a implementar

protocol PersonProtocol {
    var name: String { get set }
    var age: Int { get set }
    func fullName() -> String
}

struct Programmer: PersonProtocol {
    var name: String
    var age: Int
    var language: String
    func fullName() -> String {
        return "nombre: \(name), edad \(age)"
    }
}

struct Teacher: PersonProtocol{
    var name: String
    var age: Int
    var subject:String
    func fullName() -> String {
        return "nombre: \(name), edad \(age)"
    }
}

let myProgrammer = Programmer(name: "Agustin", age: 25, language: "JS")

let myTeacher = Teacher(name: "Claudio", age: 26, subject: "Ed Fisica")

print(myProgrammer.fullName())
print(myTeacher.fullName())


// protocolos delegados - muy usado porque permite comunicar dos clases en sentido inverso - notificar de forma asincrona

class FirstClass: SecondClassProtocol {
    
    func callSecond(){
        let secondClass = SecondClass()
        secondClass.delegate = self
        secondClass.callFirst()
    }
    
    func call() {
        print("Esta devuelta la clase first")
    }
    
}

protocol SecondClassProtocol {
    
    func call()
    
}

class SecondClass {
    
    var delegate: SecondClassProtocol?
    
    func callFirst(){
        sleep(5)
        delegate?.call()
    }
    
}

let firstClass = FirstClass()
firstClass.callSecond()


//genericosss - operaciones mas genericas

//sin genericos
func swapToInts(a: inout Int, b: inout Int) {
    let tempA = a
    a = b
    b = tempA
}

var myFirstInt = 5
var mySecondInt = 3

swapToInts(a: &myFirstInt, b: &mySecondInt)

//con genericos
func swapToGenerics2<T>(a: inout T, b: inout T) {
    let tempA = a
    a = b
    b = tempA
}

var myFirstGenerics2 = "Agustin"
var mySecondGenerics2 = "Carbajal"

swapToGenerics2(a: &myFirstGenerics2, b: &mySecondGenerics2)

//automatic reference counting (ARC)

