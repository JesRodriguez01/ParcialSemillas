import parcelas.*

class Plantas {
	var property anioDeSemilla
	var property altura
	var property horasDeSolQueTolera
	var property espacioQueOcupa
	
	method esFuerte()= self.horasDeSolQueTolera()>10
	method daNuevasSemillas()= self.esFuerte()
	method parcelaIdeal(parcela)
}

class Menta inherits Plantas{
	override method horasDeSolQueTolera()=6
	override method daNuevasSemillas()= super() or self.altura()> 0.4
	override method espacioQueOcupa()= self.altura()*3
	override method parcelaIdeal(parcela)= parcela.superficie()>6
}

class Soja inherits Plantas{
	override method horasDeSolQueTolera(){
		if (self.altura()< 0.5){return 6}
		else if(self.altura().between(0.5,1)){return 7}
		else {return 9}
	}
	override method daNuevasSemillas(){
		return super() or self.anioDeSemilla()> 2007 and self.altura()>1
    }
	override method espacioQueOcupa()= self.altura()/2
	override method parcelaIdeal(parcela){
		return parcela.horasDeSolQueRecibe()== self.horasDeSolQueTolera()
	}
}

class Quinoa inherits Plantas{
	
	override method daNuevasSemillas(){
		return super() or self.anioDeSemilla()< 2005
    }
	override method espacioQueOcupa()= 0.5
	override method parcelaIdeal(parcela){
		return parcela.plantasQueTiene().any({p => p.altura()> 1.5})
	}
}

class SojaTransgenica inherits Soja{
	override method daNuevasSemillas()= false
}

class Hiebabuena inherits Menta{
	override method espacioQueOcupa()= self.altura()*3
	override method parcelaIdeal(parcela){
		return parcela.capacidadMaxima()== 1
	}
}



