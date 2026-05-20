import wollok.game.*


class Maiz {
	const property esCultivo = true
	var property position
	var property image = "corn_baby.png"
	const property costoPorVenta = 150
	const property esMercado = false
	var property esAdulto = false
	const property esCosechable = esAdulto


	method efectoRegar() {
	  if (not self.esAdulto()){
		self.cambiarImage("corn_adult.png")
		esAdulto = true
	  }
	}

	method cambiarImage(img) {
	  image = img
	}

	method efectoCosechar() {
	  if (self.esAdulto()){
		game.removeVisual(self)
	  }
	}

	method esAdulto() {
	  return self.image() == "corn_adult.png"
	}
}

class Trigo {
	const property esCultivo = true
	var property position
	var property image = "wheat_0.png"
	const property esMercado = false
	var property esAdulto = false
	const property esCosechable = esAdulto

	
	method efectoRegar() {
	  if (self.etapa() == 0){
		self.cambiarImage("wheat_1.png")
		esAdulto = false
	  } else if (self.etapa() == 1){
		self.cambiarImage("wheat_2.png")
		esAdulto = false
	  }else if (self.etapa() == 2){
		esAdulto = true
		self.cambiarImage("wheat_3.png")
	  }else{
		esAdulto = true
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
}

class Tomaco {
	const property esCultivo = true
	var property position
	const property costoPorVenta = 80
	const property esMercado = false
	var property image = "tomaco_baby.png"
	var property esAdulto = false
	const property esCosechable = esAdulto


	method efectoRegar() {
	  if (position.y() == 0) {
		image = "tomaco.png"
		esAdulto = true
		position = game.at(position.x(), game.height() - 1)
	  }
	  else {
		image = "tomaco.png"
		esAdulto = true
	  	position = game.at(position.x(), position.y() - 1)
	  }
	}

	method efectoCosechar() {
	  game.removeVisual(self)
	}
}
