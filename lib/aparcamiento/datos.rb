require_relative "funcion.rb"

class Datos
include Comparable
include Funcion
    attr_reader :estado
    attr_reader :accesibilidad, :seguridad, :id, :nombre_comercial, :descripcion, :tipo
    #para dimensiones de plazas
    attr_reader :dimensiones
    attr_reader :plazas
    ##p9
    attr_reader :distancia, :p_minusvalidos, :precio_min
    #attr_reader :prueba


def initialize(accesibilidad, seguridad, id, nombre_comercial, descripcion, tipo, dimensiones, num_plazas)
    if accesibilidad >= 1 && accesibilidad <= 5 then
        @accesibilidad = accesibilidad 
        #@accesibilidad = 5
    end 
    if seguridad >= 1 && seguridad <= 10 then
        @seguridad = seguridad
        #@seguridad = 10
    end
        @id = id
        @nombre_comercial = nombre_comercial
        if (descripcion == "Cubierto" || "Aire libre" || "Mixto") then
            @descripcion = descripcion
        end
        if (@tipo == "autobuses" || "bicicletas" || "coches" || "motos") then
            @tipo = tipo
        end
        @dimensiones = dimensiones
        @num_plazas = num_plazas

        def to_s
            string = "accesibilidad = #{@accesibilidad}  -  seguridad = #{@seguridad}  -  id = #{@id}  -  nombre comercial = #{nombre_comercial}  -  descripcion = #{@descripcion}  -  tipo = #{@tipo}"
            #@dimensiones.each do |plazas|
            @dimensiones.collect do |plazas|
            string << " - altura => 3.0 longitud => 6.0 anchura => 7.0 "
        end
        return string
        end

       def plazas_totales
            total = 0
            #@num_plazas[0].each do |plazas|
            @num_plazas[0].collect do |plazas|
                total = total + 1
            end
            return total
        end
       
        def plazas_vacias
            no_ocupada = 0
           #@num_plazas[1].each do |plaza|
               @num_plazas[1].collect do |plaza|
                if (plaza == "vacio") then
                    no_ocupada += 1
            
                end 
            end
            return no_ocupada
        end

        def plazas_ocupadas
            ocupadas = 0
           #@num_plazas[1].each do |plaza|
           @num_plazas[1].collect do |plaza|
                if (plaza == "ocupado") then
                    ocupadas += 1
            
                end 
            end
            return ocupadas
        end

        def ind_sostenibilidad
            if (@distancia <= 30) && (@precio_min > 0.50)
                return 1
            elsif (@distancia > 30 && @distancia < 40) && (@precio_min < 0.10 && @precio_min <= 0.50)
                return 2
            elsif (@distancia >= 40) && (@precio_min < 0.10)
                return 3
            else
                return 0
            end
          end
          def <=> (valor)
          #return nil unless other.is_a? Aparcamiento
          ind_sostenibilidad() <=> valor.ind_sostenibilidad()
          end
end
end

