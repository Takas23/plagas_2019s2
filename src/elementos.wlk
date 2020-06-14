import plagas.*

class Hogar {
	var property mugre
	var property confort
	
	method esBueno() {
		return confort >= mugre * 2
	}
	method ataque(plaga) {
		mugre += plaga.nivelDanio()
		plaga.ataque()
	}
	
}

class Huerta {
	var property produccion	
	var property nivelProduccion
	
	method esBueno() {
		return produccion > nivelProduccion
	}
	method ataque(plaga) {
		produccion = (produccion - (plaga.nivelDanio() * 0.1)).max(0)
			if (plaga.enferma()) {
			produccion = (produccion - 10).max(0)	
			}
				else {}
		plaga.ataque()
	}
}

class Mascota {
	var property salud
	
	method esBueno() {
		return salud > 250
	}
	method ataque(plaga) {
			if (plaga.enferma()) { 
			salud = (salud - plaga.nivelDanio()).max(0)
			}
				else {  }
		plaga.ataque()
	}
}

class Barrio {
	var property elementos = [  ]
	
	method agregar(elemento) {
		elementos.add(elemento)
	}
	method agregarAll(listaEle) {
		elementos.addAll(listaEle)
	}
	method quitar(elemento) {
		elementos.remove(elemento)
	}
	method esBueno(elemento) {
		return elemento.esBueno()
	}
	method esCopado() {
		return elementos.count({ele => self.esBueno(ele)}) > elementos.size() / 2
	}
	method ataque(plaga) {
		elementos.forEach({ele => ele.ataque(plaga)})
	}
//prueba
	method superAtaque(listaPlagas) {
		listaPlagas.forEach({pla => self.ataque(pla)})
	}
}