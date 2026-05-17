import wollok.game.*
import direcciones.*


object personaje {
    const property esCultivo = false
	var property position = game.center()
	const property image = "fplayer.png"


    method plantar(cultivo){
        self.validarCultivar()
        game.addVisual(cultivo)
	}

    method validarCultivar(){
        if (self.hayCultivoAca()){
            game.say(self, "No puedo plantar acá, ya hay algo plantado.")
            //self.error("No se puede plantar acá.")
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
}
