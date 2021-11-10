import parcelas.*
import plantas.*

object inta {
	const property parcelas=[]
	
	method promedioDePlantas(){
		return parcelas.count({p => p.plantasQueTiene()/ parcelas.size()})
	}
	
	method esLaMasAutosustentable(){
		return parcelas.plantasQueTiene().size()> 4
		
	}
}
