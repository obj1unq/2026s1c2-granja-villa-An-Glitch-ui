import wollok.game.*


class Maiz {
	const property esCultivo = true
	var property position
	var property image = "corn_baby.png"
	const property costoPorVenta = 150
	const property esMercado = false //¿¿¿¿¿



	method efectoRegar() {
	  if (self.image() != "corn_adult.png"){
		self.cambiarImage("corn_adult.png")
	  }
	}

	method cambiarImage(img) {
	  image = img
	}

	method efectoCosechar() {
	  if (self.image() == "corn_adult.png"){
		game.removeVisual(self)
	  }
	}

	method recibirRiego() {
	  self.efectoRegar()
    }
}

class Trigo {
	const property esCultivo = true
	var property position
	var property image = "wheat_0.png"
	const property esMercado = false //¿¿¿¿¿

	
	method efectoRegar() {
	  if (self.etapa() == 0){
		self.cambiarImage("wheat_1.png")
	  } else if (self.etapa() == 1){
		self.cambiarImage("wheat_2.png")
	  }else if (self.etapa() == 2){
		self.cambiarImage("wheat_3.png")
	  }else{
		self.cambiarImage("wheat_0.png")
	  }
	}

	method cambiarImage(img) {
	  image = img
	}

	method efectoCosechar() {
	  if (self.etapa() == 2 || self.etapa() == 3){
		game.removeVisual(self)
	  }
	}

	method costoPorVenta() {
	  return (self.etapa() - 1) * 100
	}

	method etapa() {
	  return if (self.image() == "wheat_0.png"){
		0
	  } else if (self.image() == "wheat_1.png"){
		1
	  } else if (self.image() == "wheat_2.png"){
		2
	  } else {
		3
	  }
	}

	method recibirRiego() {
	  self.efectoRegar()
    }
}

class Tomaco {
	const property esCultivo = true
	var property position
	const property costoPorVenta = 80
	const property esMercado = false //¿¿¿¿¿


	method image() {
		return "tomaco.png"
	}

	method efectoRegar() {
	  if (position.y() == 0) {
		position = game.at(position.x(), game.height() - 1)
	  }
	  else {
	  	position = game.at(position.x(), position.y() - 1)
	  }
	}

	method efectoCosechar() {
	  game.removeVisual(self)
	}

	method recibirRiego() {
	  self.efectoRegar()
    }
}
