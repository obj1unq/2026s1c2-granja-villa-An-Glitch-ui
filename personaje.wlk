import wollok.game.*
import direcciones.*
import cosas.*



object personaje {
  const property esCultivo = false
  const property esMercado = false
	var property position = game.center()
	const property image = "fplayer.png"
  var property cosechas = []
  var property monedas = 0
  var property eM = new Market(position = self.position())
  const property esCosechable = false



  method plantar(cultivo){
    self.validarCultivar()
    game.addVisual(cultivo)
	}

  method validarCultivar(){
    if (self.hayCultivoAca()){
      self.error("No puedo plantar acá, ya hay algo plantado.")
		}
	}

  method hayCultivoAca(){
    return game.getObjectsIn(position).any({c => c.esCultivo()})
	}

  method mover(direccion) {
    const nuevaPosition = direccion.siguiente(position)
		position = nuevaPosition
  }

  method regar() {
    self.validarRegar()
    game.getObjectsIn(position).forEach({c => c.efectoRegar()})
  }

  method validarRegar() {
    if (not self.hayCultivoAca()){
      self.error("No tengo nada para regar.")
    }
  }

  method cosechar() {
    self.validarCosecha()
    cosechas.add(self.cultivoDeLaPosicionActual())
    game.getObjectsIn(position).forEach({c => c.efectoCosechar()})
  }

  method validarCosecha() {
    if (not self.hayCultivoAca() && not self.esCultivoCosechable()){
      self.error("No tengo nada para cosechar.")
    }
  }

  method esCultivoCosechable() {
    return game.getObjectsIn(position).any({c => c.esCosechable()})
  }

  method cultivoDeLaPosicionActual() {
    return game.getObjectsIn(position).filter({c => c.esCultivo()}).first()
  }

  method venderCosecha() {
    //console.println("MONTO")
    if (self.hayUnMercadoAca()){
      monedas += self.costoTotalDeCultivos()
      cosechas.clear()
      eM.comprarElMonto(self.costoTotalDeCultivos())
    }
  }

  method hayUnMercadoAca() {
    return game.getObjectsIn(position).any({c => c.esMercado()})
  }

  method costoTotalDeCultivos() {
    return cosechas.sum({c => c.costoPorVenta()})
  }

  method cantDeCosechas() {
    return cosechas.count({c => c.esCultivo()})
  }

  method colocarAspersor() {
    self.validarPosicionVacia()
    const asp = new Aspersor(position = self.position())
    game.onTick(1000, "aspersor" + asp.identity(), {asp.tick()})
    game.addVisual(asp)
  }



  method validarPosicionVacia() {
    if (game.getObjectsIn(position).size() != 1){   // comparar con 1 porque contaría "solamente" el pj en la posición actual
      game.say(self, "No puedo colocar un aspersor acá, ya hay uno. " )
      self.error("No puedo colocar un aspersor acá.")
    }
  }


    // ================== feo ==================
  method efectoRegar() {
    //nada
  }

  method efectoCosechar() {
    //nada
  }
}
