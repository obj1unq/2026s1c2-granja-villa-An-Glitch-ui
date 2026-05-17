import wollok.game.*

object personaje {
	var property position = game.center()
	const property image = "fplayer.png"

    method plantar(cultivo){
        self.validarCultivar()
        ...
	}

    method validarCultivar(){
        if hayCultivoAca(){
            self.error("No puedo plantar acá, ya hay algo plantado.")
		}
	}

    method hayCultivoAca(){
        return ...
	}
}
