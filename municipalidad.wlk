import rodados.*

class Dependencia{
    const cantidadDeEmpleados
    const flota = new List()
    const registroDePedidos = new List()
    
    method agregarAFlota(unRodado){flota.add(unRodado)}
    method quitarDeFlota(unRodado){flota.remove(unRodado)}
    method pesoTotalFlota() = flota.sum({auto => auto.peso()})
    method estaBienEquipada() = flota.size() >= 3 and flota.all({auto=>auto.velocidad()>=100})
    method capacidadTotalEnColor(unColor) = flota.filter({auto=>auto.color()==unColor}).sum({auto=>auto.capacidad()})
    method colorDelRodadoMasRapido() = flota.max({auto=>auto.velocidad()}).color()
    method capacidadFaltante() = cantidadDeEmpleados - flota.sum({auto => auto.capacidad()})
    method esGrande() = cantidadDeEmpleados >= 40 and flota.size() >= 5

    method agregarPedido(unPedido) {registroDePedidos.add(unPedido)}
    method quitarPedido(unPedido)  {registroDePedidos.remove(unPedido)}

    // etapa 3
    method totalDePasajerosDePedidos(){
        return registroDePedidos.sum({pedido => pedido.cantPasajeros()})
    }
    method pedidosQueNoPuedenSatisfacerse(){
        // Consigna: cuáles de los pedidos que tiene registrados no puede ser satisfecho
        // por ninguno de los autos afectados a la dependencia.
        return registroDePedidos.filter({pedido => flota.all({auto=>not pedido.satisfacePedido(auto)})})
        
    }
    method esColorIncompatibleEnPedidos(unColor){
        // Consigna: dado un color, si es cierto que 
        // todos los pedidos registrados lo tienen como color incompatible.
        return registroDePedidos.all({pedido=>pedido.coloresIncompatibles().contains(unColor)})
    }
    method relajarPedidos(){
        registroDePedidos.forEach({pedido => pedido.relajar()})
    }
}

class Pedido{
    const distancia
    var tiempoMax
    const property cantPasajeros
    const property coloresIncompatibles = new Set()

    method velocidadRequerida() = distancia / tiempoMax
    method satisfacePedido(unAuto){
        return (unAuto.velocidad() > self.velocidadRequerida() + 10)
        and unAuto.capacidad() >= cantPasajeros
        and coloresIncompatibles.all({color => color != unAuto.color()})
    }
    method agregarColorIncompatible(unColor){
        coloresIncompatibles.add(unColor)
    }
    method acelerar(){tiempoMax -= 1}
    method relajar() {tiempoMax += 1}
}