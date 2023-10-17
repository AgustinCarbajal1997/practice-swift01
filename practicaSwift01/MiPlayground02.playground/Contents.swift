import Foundation

let myString:String = "Bienvenidos al curso de swift"
let myStringConcat = myString + " Hola mundo"
let myString01 = String()
let myCharacter: Character = "🤣"
//Interpolacion
var nombre = "\(myString) \(myStringConcat)"

//COMPARACIONES

let name1 = "Agustin"
let name2 = "Claudio"
let credential = false


name1 != name2
name1 == name2

name1.contains(name2)
name1.isEmpty

//recorrido
for value in name1 {
    print(value)
}

//condicionales

if credential {
    print("es true")
} else {
    print("fue false")
}


//Arrays

var arreglo:[Int] = [1,2,3]
arreglo.append(5)
let ultimoData = arreglo.last
print(Int(arreglo[0]))
print(arreglo[3])

//diccionarios

//diccionarios clasicos - como se declaraban antes y ahora. los diccionarios no tienen un orden, se busca por las keys

let myClassicDictionary = Dictionary<Int, String>()
var myModernDictionary = [Int:String]()

myModernDictionary = [001:"Agustin", 002:"Claudio"]

myModernDictionary[003] = "Miguel"

print(myModernDictionary)

myModernDictionary[003] = nil

print(myModernDictionary)


//tuplas

var persona = (name:"Agustin", surname:"Carbajal", age:25)

print(persona.age, persona.name)

//enumeraciones

enum PersonalData {
    case name
    case surname
    case address
    case phone
}

var currentData: PersonalData = .name
var input = "Agustin"


enum ComplexPersonalData {
    case name(String)
    case surname(String, String)
    case address(String, Int)
    case phone(Int)
}

var complexCurrentData: ComplexPersonalData = .name("Agustin")
complexCurrentData = .address("Los juncaros", 350)

enum RawPersonalData:String {
    case name
    case surname
    case address
    case phone
}

print(RawPersonalData.name.rawValue)


// operadores de rango

var arreglo2 = [0,1,2,3,4,5,6,7,8,9]

//operador rango doble - two sided range operator

var subsetArreglo2 = arreglo2[1...3]

//operador rango unico - one sided range operator

var subsetArreglo3 = arreglo2[...3]

var subsetArreglo4 = arreglo2[5...]

//if else

var edad = 25
var dinero = 250

if edad <= 25 && dinero == 250 {
    print("Es menor o igual a 25")
}else {
    print("Es mayor a 25")
}

//switch

let country = "ES"

switch country {
case "ES":
    print("España")
case "MX":
    print("Mexico")
case "ARG":
    print("Argentina")
default:
    print("No conocemos el idioma")
}


//switch con enum


enum PersonalDataSwitch {
    case name
    case surname
    case address
    case phone
}

let userDataSwitch: PersonalDataSwitch = .name

switch userDataSwitch {
case .name:
    print("Estamos editando name")
case .surname:
    print("Estamos editando surname")
case .address:
    print("Estamos editando address")
case .phone:
    print("Estamos editando phone")
}


// bucles for
var contadora = 0

for numero in 1...4 {
    contadora += 1
    print(numero)
}

print("contadora " + String(contadora))

//funciones

func holaMundo(){
    print("Hola mundo desde dentro de la funcion")
}

holaMundo()

func suma(x:Int, y:Int){
    print(x+y)
}

suma(x: 10, y: 20)
suma(x:5, y: 6)


func cuboDe (numero:Int) -> Int {
    let cubo = numero * numero * numero
    return cubo
}

let resultadoCubo = cuboDe(numero: 10)
print(resultadoCubo)

func saludaralumno(name:String, message:String = "Mje de default") -> String {
    let paragraph = "Hola \(name)! \(message)" 
    return paragraph
}

let newMessage = saludaralumno(name: "Agustin", message: "Como estas?")
print(newMessage)
let newMessage1 = saludaralumno(name: "Agustin")
print(newMessage1)

// func return multiple values

func listaNombres (items: [String]) -> [String] {
    return items
}

print(listaNombres(items:["Agustin", "Claudio", "Miguel"]))


//Clousures
/*
 
 let clousureVar = {
     (parameters) -> type-value-return in
     code
 }
 
 */
let myfisrtClousure = {
    (items: [String]) -> [String] in
    return items
}

print(myfisrtClousure(["Agustin", "Claudio", "Miguel"]))
