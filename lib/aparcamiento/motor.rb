#require_relative 'vehiculo'

class Motor < Vehiculos
include Comparable
    attr_reader :num_ruedas, :num_pasajeros, :pot_motor, :vel_max
    def initialize(num_ruedas, num_pasajeros, pot_motor, vel_max)
        @num_ruedas = num_ruedas
        @num_pasajeros = num_pasajeros
        @pot_motor = pot_motor
        @vel_max = vel_max
end
def to_s 

    "Numero de ruedas = #{@num_ruedas}  -  Numero de pasajeros = #{@num_pasajeros}  -  Potencia del motor = #{@pot_motor}  -  Velocidad Máxima = #{@vel_max}"
end
def <=> (numero_plazas_vehiculo) 
    @num_pasajeros <=> (numero_plazas_vehiculo.num_pasajeros)
end
end
#

