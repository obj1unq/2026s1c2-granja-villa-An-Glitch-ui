import wollok.game.*
import direcciones.*


object personaje {
  const property esCultivo = false
	var property position = game.center()
	const property image = "fplayer.png"
  var property cosecha = []
  var property monedas = 0


  method plantar(cultivo){
    self.validarCultivar()
    game.addVisual(cultivo)
	}

  method validarCultivar(){
    if (self.hayCultivoAca()){
      //game.say(self, "No puedo plantar acá, ya hay algo plantado.")    ¿¿¿
      self.error("No se puede plantar acá.")
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
    self.validarCosechar()
    cosecha = game.getObjectsIn(position).filter({c => c.esCultivo()})    // ???
    game.getObjectsIn(position).forEach({c => c.efectoCosechar()})
  }

  method validarCosechar() {
    if (not self.hayCultivoAca()){
      self.error("No tengo nada para cosechar.")
    }
  }

  method venderCosecha() {
    monedas += cosecha.forEach({c => c.costoPorVenta()})
    cosecha = []
  }

  method colocar(cosa) {
    self.validarPosicionVacia()
    game.addVisual("aspersor")
  }

  method validarPosicionVacia() {
    if (game.getObjectsIn(position) == 1){   // comparar con 1 porque contaría "solamente" el pj en la posición actual
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

  method recibirRiego() {
	  // nada
  }
}
