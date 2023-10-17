import Foundation

//Conjuntos

var mySet = Set<String>()
var mySet1: Set<String> = ["Agustin", "Carbajal"]
mySet.insert("Miguel")

if let index = mySet1.firstIndex(of: "Agustin"){
    mySet1.remove(at: index)
}

print(mySet1)

for myElement in mySet1{
    print(myElement)
}

//operaciones de conjunto
let myIntSet: Set = [1, 2, 3, 4, 5]
let myIntSet2: Set = [0, 2, 3, 6, 7]

//interseccion
print(myIntSet.intersection(myIntSet2))

//diferencia simetrica
print(myIntSet.symmetricDifference(myIntSet2))

//union
print(myIntSet.union(myIntSet2))

//substraccion
print(myIntSet.subtracting(myIntSet2))


//algoritmos de colecciones
var myArray = [5, 8, 1, 10, 15, 12, 3]
let myDictionary = [
    8:"ocho",
    3:"tres",
    5:"cinco"
]

let mySet12: Set = [5, 8, 1, 10, 15, 12, 3]

myArray.sort()

let myMapArray = myArray.map {(myInt) -> Int in
    return myInt + 10
}

let myStringMapArray = myArray.map {(myInt) -> String in
    return "\(myInt)"
}

myArray.forEach{(myInt) in
    print("myArray")
}
