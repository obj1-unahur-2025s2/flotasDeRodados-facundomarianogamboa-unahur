class Corsa{
    const property capacidad = 4
    const property velocidad = 150
    const property peso = 1300
    const property color
}

class Kwid{
    const property tanqueAdicional
    const property color = "azul"
    method capacidad() = if(!tanqueAdicional) 4 else 3 
    method velocidad() = if(!tanqueAdicional) 120 else 110
    method peso() = if(!tanqueAdicional) 1200 else 1350 
}

object traffic {
    var interior = interiorPopular
    var motor = motorBataton
    method capacidad() = interior.capacidad()
    method velocidad() = motor.velocidad()
    method peso() = 4000 + interior.peso() + motor.peso()
    method color() = "blanco" 
    method configurarInterior(nuevoInterior){interior=nuevoInterior}
    method configurarMotor(nuevoMotor){motor=nuevoMotor}
}

object interiorComodo {
    method capacidad() = 5
    method peso() = 700
}

object interiorPopular {
    method capacidad() = 12
    method peso() = 1000
}

object motorPulenta{
    method peso() = 800
    method velocidad() = 130
}

object motorBataton {
    method peso() = 500
    method velocidad() = 80
}

class AutoEspecial{
    const property capacidad
    const property velocidad
    const property peso
    const property color
}