module Funcion
    
    COMPLETO = "Lleno"
    LIBRES = "Existen plazas libres"
    APARCADO = "El vehículo está aparcado"
    NO_APARCADO = "El vehículo no está aparcado"
    attr_reader :coste_total 
    attr_reader :situacion_aparcamiento
    def Funcion.estado(parking)
        if parking.plazas_ocupadas == 0
            return COMPLETO
        else 
            return LIBRES
    end
end
    def Funcion_aparcar(vehiculo) 
      @situacion_aparcamiento = "Esta plaza está ocupada por #{vehiculo}"
end
attr_reader :duracion_estimada
def Duracion(hora_salida, hora_entrada)
    @duracion_estimada = hora_salida - hora_entrada
    return @duracion_estimada
end

def Precio_a_pagar(tiempo_total)
    @coste_total = tiempo_total * precio_min
end
attr_reader :plazas
def plazas_totales_minusvalidos(plazas)
    @plazas = plazas
end
attr_reader :proporcion
def plazas_minusvalidos_proporcion
    @proporcion = (@p_minusvalidos.to_f / @plazas.to_f)
    if proporcion >= 0.025 then
        return true
    else
        return false
    end
end
    def p_minusvalidos_libres(p_minusvalidos_ocupadas)
      prueba = (@p_minusvalidos.to_f - p_minusvalidos_ocupadas.to_f)
    return prueba
        
    end
    def vehiculos_estacionados(plazas_ocupadas)
        return "Hay #{plazas_ocupadas} vehiculos"
    end
    def setterPract10(distancia, precio_min)
        @distancia = distancia
        @precio_min = precio_min
    end
    attr_reader :p_minusvalidos_ocupadas
    def setterPMinusvalidos(p_minusvalidos, p_minusvalidos_ocupadas)
        @p_minusvalidos = p_minusvalidos
        @p_minusvalidos_ocupadas = p_minusvalidos_ocupadas
    end
  
    def getterPMinusvalidoslibres2
        return (@p_minusvalidos.to_f - @p_minusvalidos_ocupadas.to_f)
    
    end

    def porcentaje_aparcamiento()
        total = 0
        #@num_plazas[0].each do |plazas|
        @num_plazas[0].collect do |plazas|
            total = total + 1
        end
        no_ocupada = 0
        #@num_plazas[1].each do |plaza|
            @num_plazas[1].collect do |plaza|
             if (plaza == "vacio") then
                 no_ocupada += 1
         
             end 
         end
         aux = ((no_ocupada.to_f * 100) / total.to_f)
         return aux.round(2)
     end
     def porcentaje_aparcamiento_min()
        aux =  ((@p_minusvalidos_ocupadas.to_f * 100) / @p_minusvalidos.to_f)
        return aux.round(2)
     end
end
