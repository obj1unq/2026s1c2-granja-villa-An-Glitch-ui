import wollok.game.*


class Aspersor {
  var property position
  const property image = "aspersor.png"

  method tick() {
	self.regarAlrededor()
  }

  method regarAlrededor() {
	self.vecinos().forEach({ v =>v.recibirRiego()})
  }

  method vecinos() {
	return game.getObjectsIn(position).filter({ v => self.esLimitrofe(v.position())})
  }

  method esLimitrofe(unaPosicion) {
	return self.position().distance(unaPosicion) == 1
  }

  method recibirRiego() {
	// nada
  }
}

class Market {
    var property position
    const property image = "market.png" 
}