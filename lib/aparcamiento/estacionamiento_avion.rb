
require_relative "datos.rb"
class Estacionamiento_avion < Datos
include Comparable
    attr_reader :n_plantas
    def initialize(n_plantas, p_minusvalido, distancia, precio_min, conjunto_vehiculos, dimension)
        @n_plantas = n_plantas
        @precio_min = precio_min
        @p_minusvalido = p_minusvalido
        @dimension = dimension
        @distancia = distancia
        
        if @p_minusvalido > 0 then
            raise "Altura de plaza de minusválido inválida" unless @dimension[:altura] >= 5.0
            #raise "Largo de plaza de minusválido invalida" unless @dimension[:largo] >= 5.0
            raise "Anchura de plaza de minusválido inválida" unless @dimension[:anchura] >= 2.0
            raise "Espacio lateral de plaza de minusvalido inválida" unless @dimension[:espacio_lateral] >= 1.5
          
        else
            raise "Comprobacion de float" unless @dimension[:altura].is_a?(Float) == true
            raise "Comprobacion de float" unless @dimension[:largo].is_a?(Float) == true
            raise "Comprobacion de float" unless @dimension[:anchura].is_a?(Float) == true
            raise "Comprobacion de float " unless @dimension[:espacio_lateral].is_a?(Float) == true
           
          end
end 
end