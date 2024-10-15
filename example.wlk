class Bicicleta{
  const property accesorios = [] 
  var property rodado = 26
  const property largo = 120
  const property marca = "legnano"

  method altura() = rodado * 2.5 + 15
  
  method velocidadCrucero(){
    return if(largo > 120)rodado + 6 
      else rodado + 2
  }
  method carga(){
    return accesorios.sum({a => a.carga()})
  }

  method peso(){
    return rodado/2 + accesorios.sum({a => a.peso()})
  }

  method tieneLuz(){
    return accesorios.any({a =>a.esLuminoso() })
  }

  method accesoriosLivianos(){
    return accesorios.count({a =>a.peso() < 1})
  }
  method esCompaniera(unaBici){
    return unaBici.marca() == self.marca() && unaBici.largo() - self.largo() <= 10 && unaBici != self
  }
}

class Farolito{
  method peso()= 0.5
  method carga() = 0
  method esLuminoso() = true
}

class Canasto {
  const volumen
  method peso()= volumen / 10
  method carga() = volumen * 2
  method esLuminoso() = false
}

class Morral {
  const largo
  var property tieneOjoDeGato = true
  method peso()= 1.2
  method carga() = largo / 3
  method esLuminoso() = tieneOjoDeGato
  
}

class Deposito{
  const property coleccionBicis = []

  method bicisRapidas(){
    return coleccionBicis.filter({b=>b.velocidadCrucero() > 25})
  } 
  method marcasBicis() {
    return coleccionBicis.map({b=>b.marca()}).asSet() 
  } 
  method nocturno() {
    return coleccionBicis.any({b =>b.tieneLuz()})
  }
  method algunaBiciPuedeCargar(unKg) {
    return coleccionBicis.any({b=>b.carga()>unKg})
  }

  method biciMasRapida() {
    return coleccionBicis.max({b=>b.velocidadCrucero()}).marca()
  } 
  method bicisLargas(){
    return coleccionBicis.filter({b=>b.largo()>170})
  }
  method cargaTotalBicisLargas(){
    return if(! self.bicisLargas().isEmpty()){
      self.bicisLargas().sum({b=>b.carga()})}
    else return 0
  }
  method bicisSinAccesorios(){
    return coleccionBicis.count({b=>b.accesorios().isEmpty()})
  }

  method bicisCompasDe(unaBicicleta){
    return coleccionBicis.filter({b=>b.esCompaniera(unaBicicleta)})
  }

}
