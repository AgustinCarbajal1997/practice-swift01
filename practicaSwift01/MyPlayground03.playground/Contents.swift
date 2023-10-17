import UIKit

//POO

//structs
struct cuadrados {
    
    //propiedades
    var ancho = 10
    var alto = 10
    
    //metodos
    func area() -> Int {
        return ancho * alto
    }
    
}

var miCuadrado = cuadrados()

print(miCuadrado.alto * miCuadrado.ancho)
print(miCuadrado.area())


// clases

class Automovil {
    var color = "neutro"
    var llantas = 4
    var precio = 0
    
    func encender() -> Bool {
        return true
    }
    func acelerar() -> Bool {
        return true
    }
    func apagar() -> Bool {
        return true
    }
    
}

var objetoMazda = Automovil()
print(objetoMazda.llantas)
objetoMazda.precio = 600
print(objetoMazda.precio)


// diferencia class y struct - copia vs referencia

class claseAutomovil {
    var color = "neutro"
    var llantas = 4
    var precio = 0
}

var objetoMazda1 = claseAutomovil()
objetoMazda1.precio = 500
print(objetoMazda1.precio)
var objetoMazda2 = objetoMazda1 //instancia de clase es referencia. Hay herencia, en clases no
objetoMazda2.precio = 3000
print(objetoMazda2.precio)
print("valor viejo clase objeto primera instancia")
print(objetoMazda1.precio)

struct structAutomovil {
    var color = "neutro"
    var llantas = 4
    var precio = 0
}

var structMazda1 = structAutomovil()
structMazda1.precio = 500
print(structMazda1.precio)

var structMazda2 = structMazda1 //instancia de estructura es copia - cada uno tiene su propio espacio en memoria. A diferencia de las clases, als estructuraras no pueden heredar
structMazda2.precio = 3000
print(structMazda2.precio)
print("valor viejo estructura primera instancia")
print(structMazda1.precio)
