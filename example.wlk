// Celulares
/* 
Se pide representar con objetos a personas que hablan entre sí por celulares.
Juliana tiene un Samsung S21, y Catalina tiene un iPhone.
El Samsung S21 pierde 0,25 "puntos" de batería por cada llamada, y el iPhone pierde 0,1% de la duración de cada llamada en batería. 
Ambos celulares tienen 5 "puntos" de batería como máximo.
Implementar a Juliana, Catalina, el Samsung S21 de Juliana y el iPhone de Catalina en Wollok y hacer pruebas en donde Juliana y Catalina se hagan 
llamadas telefónicas de distintas duraciones.
Conocer la cantidad de batería de cada celular.
Saber si un celular está apagado (si está sin batería).
Recargar un celular (que vuelva a tener su batería completa).
Saber si Juliana tiene el celular apagado; saber si Catalina tiene el celular apagado.
Ahora podemos también tener en cuenta el costo de las llamadas que se hacen entre Catalina y Juliana. 
Catalina tiene contratado como servicio de telefonía celular a Movistar, Juliana a Personal. Movistar cobra fijo $60 final el minuto, Claro cobra $50 el 
minuto + 21% de IVA y Personal $70 final los primeros 10 minutos que usaste el celu, y $40 el minuto el resto. 
Se pide hacer un diagrama de objetos que represente esto y saber cuánta plata gastó cada uno luego de haberse hecho varias llamadas entre sí.
*/

object juliana{
  var property celular = samsungS21
  var property servicio = personal 
  var facturaAPagar = 0
  method realizarLlamada(minutos){
    celular.perderBateriaPorLlamada()
    facturaAPagar += servicio.montoAPagar(minutos)
  }
  method factura() = facturaAPagar
}

object catalina{
  var property  celular = iphone
  var property servicio = movistar
  var facturaAPagar = 0
  method realizarLlamada(minutos){
    celular.perderBateriaPorLlamada()
    facturaAPagar += servicio.montoAPagar(minutos)
  }
  method factura() = facturaAPagar
}

object samsungS21{
  var bateria = 5

  method perderBateriaPorLlamada(){
    bateria -= 0.25
  }

  method bateria() = bateria 

  method estaApagado() = bateria == 0

  method recargar(){
    bateria = 5
  }
}

object iphone{
  var bateria = 5
  method perderBateriaPorLlamada(){
    bateria -= 0.1
  }

  method bateria() = bateria 

  method estaApagado() = bateria == 0

  method recargar(){
    bateria = 5
  }
}

object movistar{
  method montoAPagar(minutos) = minutos * 60
}

object personal{
  method montoAPagar(minutos){
    if(minutos <= 10){
      return minutos * 70
    }else{
      return (minutos - 10) * 40 + 700
    }
  }

}

object claro{
  method montoAPagar(minutos) = self.aplicarIva(self.costoMinutos(minutos))

  method aplicarIva(monto) = monto * 1.21 

  method costoMinutos(minutos) = 50 * minutos

}

