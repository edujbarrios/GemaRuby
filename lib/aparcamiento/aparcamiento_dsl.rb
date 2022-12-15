module Aparcamiento
    class AparcamientoDSL
        attr_reader :nombre_registro, :registrados, :solicitados
        def initialize(nombre_registro, &block)
            @name = name
            @solicitado = []
            @registrados = []

            instance_eval &block
        end
        def registrar(name, options = {})
        registrar = [name, options[:plazas_larga_estancia], options[:distancia], options[:precio_min], options[:vehiculos], options[:id], options[:nombre_comercial], options[:descripcion], options[:tipo], options[:dimensiones], options[:plazas]]
        @registrados.push(registrar) 
        end
        def solicitar(name, options = {})
        solicitar = [name, options[:id], options[:altura], options[:ancho], options[:largo], options[:peso]]
        @solicitados.push(solicitar)
    end
    def to_s
        @solicitados.each do |solicitud|
            @registrados.each do |registro|

                if (solicitud[2] < registro[9][:altura] && solicitud[3] < registro[9][:anchura] && solicitud[4] < registro[9][:longitud]) then
                    return "El vehiculo #{solicitud[0]} se puede aparcar al parking #{registro[0]}"
                else
                    return "El vehiculo #{solicitud[0]} NO se puede aparcar en el parking #{registro[0]}"
                end
            end
        end
    end

    def <=> (otro)
        registrar <=> otro.registrar
    end

end

end