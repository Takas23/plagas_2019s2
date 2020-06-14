//clase testigo
class Plaga { 
	var property poblacion
	
	method nivelDanio() {
		return poblacion
	}
	method enferma() {
		return poblacion >= 10
	}
	method ataque() {
		poblacion = poblacion + (poblacion * 0.1)
	}
}

class PlagaCucarachas inherits Plaga {
	var property pesoPromedio
	
	override method nivelDanio() {
		return poblacion / 2
	}
	override method enferma() {
		return super() 
			and pesoPromedio >= 10
	}
	override method ataque() {
		super()
		pesoPromedio += 2
	}
}

class PlagaPulgas inherits Plaga{
	override method nivelDanio() {
		return poblacion * 2
	}
}

class PlagaGarrapatas inherits PlagaPulgas{
	override method ataque() {
		poblacion = poblacion + (poblacion * 0.2)
	}
}

class PlagaMosquitos inherits Plaga {
	override method enferma() {
		return super()
			and poblacion % 3 == 0
	}
}