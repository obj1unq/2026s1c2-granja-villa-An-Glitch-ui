import wollok.game.*


class Aspersor {
  var property position
  const property image = "aspersor.png"
  const property esMercado = false
  const property esCultivo = false



  method tick() {
	  self.regarAlrededor()
  }

  method regarAlrededor() {
	  self.vecinos().forEach({v => v.efectoRegar()})
  }

  method vecinos() {
	  return game.getObjectsIn(position).filter({v => self.esLimitrofe(v.position())})
  }

  method esLimitrofe(unaPosicion) {
	  return self.position().distance(unaPosicion) == 1
  }

  method efectoRegar() {
	// nada
  }
}

class Market {
  var property position
  const property image = "market.png" 
  const property esMercado = true 
  const property esCultivo = false
  var property montoTotal = 10000
  const property mercaderia = []

  method comprarElMonto(monto) {
    montoTotal -= monto
    console.println(montoTotal)
  }

  method efectoRegar() {
    // nada
  }
}
