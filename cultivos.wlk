import wollok.game.*
import personaje.*


class Maiz {
	const property esCultivo = true
	var property position
	var property image = "corn_baby.png"

	//method image() {
	//	return "corn_baby.png"
	//}

	method efectoRegar() {
	  if (self.image() != "corn_adult.png"){
		self.cambiarImage("corn_adult.png")
	  }
	}

	method cambiarImage(img) {
	  image = img
	}
}

class Trigo {
	const property esCultivo = true
	var property position
	var property image = "wheat_0.png"

	//method image() {
	//	return "wheat_0.png"
	//}

	method efectoRegar() {
	  if (self.image() == "wheat_0.png"){
		self.cambiarImage("wheat_1.png")
	  } else if (self.image() == "wheat_1.png"){
		self.cambiarImage("wheat_2.png")
	  }else if (self.image() == "wheat_2.png"){
		self.cambiarImage("wheat_3.png")
	  }else{
		self.cambiarImage("wheat_0.png")
	  }
	}

	method cambiarImage(img) {
	  image = img
	}
}

class Tomaco {
	const property esCultivo = true
	var property position

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
}
