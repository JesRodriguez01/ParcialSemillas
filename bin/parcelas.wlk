import plantas.*

class Parcelas{
	var property ancho
	var property largo
	var property horasDeSolQueRecibe
	const property plantasQueTiene= []	
	
	method superficie()= self.ancho()* self.largo()
	
	method capacidadMaxima(){
		if (self.ancho()> self.largo()){return self.superficie()/5}
		else {return self.superficie()/3 + self.largo()}
	}
	
	method tieneComplicaciones(){
		return plantas.any({p => p.horasDeSolQueTolera()< self.horasDeSolQueRecibe()})
	}
	
	method plantar(unaPlanta){
		if (self.hayEspacio()and self.superaElSolTolerado(unaPlanta)){
			plantasQueTiene.add(unaPlanta)}
		    else {self.error("no se puede plantar")}
	 }
	 
	method hayEspacio(){
		return plantasQueTiene.size() < self.capacidadMaxima()
	}
	
	method superaElSolTolerado(unaPlanta){
		return self.horasDeSolQueRecibe()== unaPlanta.horasDeSolQueTolera()+2
	}
}

class ParcelasEcologicas inherits Parcelas{
	method esPacelaEcologica(){
		return not self.tieneComplicaciones() and plantas.parcelaIdeal(parcela)
	}
	
}

class ParcelasIndustriales inherits Parcelas{
	
	method esPacelaIndustrial(){
		return self.plantasQueTiene().size()<=2
	}
	
}
