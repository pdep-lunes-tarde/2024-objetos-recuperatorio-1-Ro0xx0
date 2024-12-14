class Mago {
    const  property nombre
    const property  resistencia
    const poderInato
    var property  puntosDeEnergiaMagica
    const objetos= new List()

    method poderInato()=poderInato.between(1, 10)
    

    
    method poderTotal()=(objetos.sum({objeto=>objeto.aportaAl(self)}))*poderInato
    

    method letrasPar()= self.cantidadDeLetras().even()

    method cantidadDeLetras()=nombre.length()

    method desafiar(magorival){
        if( magorival.esVencido(self))
            {self.robar(magorival)
            }
        }
    
    method esVencido(magoAtacante)

    method pierde()

    method robar(magorival){
        self.sumaDepuntos(magorival)
            magorival.restaDepuntos(self)

    }

    method sumaDepuntos(magoAtacante){
        puntosDeEnergiaMagica =+ magoAtacante.pierde()
    }
    method restaDepuntos(magoAtacante){
        puntosDeEnergiaMagica =- magoAtacante.pierde()
    }

    method recicirPuntosLider(cantidad){
        puntosDeEnergiaMagica =+ cantidad
    }







}
class Aprendiz inherits Mago{

    override method esVencido(magoAtacante)=self.resistencia()<magoAtacante.poderTotal()

    override method pierde()=self.puntosDeEnergiaMagica()/2


}
class Veterano inherits Mago{

    override method esVencido(magoAtacante)=(self.resistencia()*1.5)<magoAtacante.poderTotal()

    override method pierde()=self.puntosDeEnergiaMagica()/4


}
class Imortales inherits Mago{

    override method esVencido(magoAtacante)=false

}
class Varita{

    var property valorBase 

    method aportaAl(mago){
        if(mago.letrasPar()) valorBase + (valorBase*0.5) else valorBase
    }
    

}
class TunicaComun { 
    method aportaAl(mago)= mago.resistencia()*2
}
class TunicaEpica inherits TunicaComun{
    const puntosfijo = 10
    override method aportaAl(mago)=super(mago)+puntosfijo
}

class Amuleto{
    method aportaAl(mago)=200
}
object ojota {
    method aportaAl(mago)=10*mago.cantidadDeLetras()
}


class Gremios{
    const magos= new List()
   
    method initialize(){
       if(magos.size()>= 2){
        self.error("No se puede")
       }
       }

    method poderTotal()=magos.sum({mago=>mago.poderTotal()})

    method reservaDeEnergia()=magos.sum({mago=>mago.puntosDeEnergiaMagica()})



        
    method vencer(algo)=algo.resistecia()<self.poderTotal()

    method resistencia()=magos.sum({mago=>mago.resistencia()})+(self.lider()).resistencia()

    
        
    
    // method magossonVencincidos(algo){
    //     magos.forEach({mago=>mago.restaDepuntos(algo)})
    // }

    method queSonpuntosRobados()= magos.sum({mago=>mago.pierde()})

    method puntosrobadosde(algo)=algo.queSonpuntosRobados()
    
  

    method sumaPuntosAlLider(algo){
        self.lider().recicirPuntosLider(self.puntosrobadosde(algo))
    }
    



    method desafiar(algo){ 
        if( self.vencer(algo))
            {self.sumaPuntosAlLider(algo)
            // method algo.magossonVencincidos(self)
        }}
    method lider()=magos.max({mago=>mago.poderTotal()})
}
// 3 nesesita hacer un cambio ya q por si solo no funcionaria ,se debe implementar un metodo q analize si el lider es un gremio,y si es un gremio busca en el gremio el lider , y devulve el lider\
