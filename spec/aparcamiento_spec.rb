# frozen_string_literal: true

RSpec.describe Aparcamiento do

  it "Tiene un número de version usando la sintaxis semántica X, Y, Z" do
    expect(Aparcamiento::VERSION).not_to be(nil)
  end
  describe Funcion do
    before :all do
      @parking1 = Datos.new(2, 8, 3333, "ejemplo1", "Mixto", "coche", [{:altura => 3.0, :longitud => 6.0, :anchura => 7.0}], [["plaza1", "plaza2", "plaza3"], ["vacio", "ocupado", "vacio"]])
    end 
    it "Se cuenta con una constante para representar si el aparcamiento está completo" do
      expect(Funcion::COMPLETO).not_to be(nil)
    end
    it "Se cuenta con una constante para representar si el aprcamiento tiene plazas libres" do
      expect(Funcion::LIBRES).not_to be(nil)
    end
      it "Se cuenta con una constante para representar si el aprcamiento no está aparcado" do
        expect(Funcion::NO_APARCADO).not_to be(nil)
      end
      it "Se cuenta con una constante para representar si el aprcamiento está aparcado" do
        expect(Funcion::APARCADO).not_to be(nil)
      end
    
      it "Se cuenta con una funcion para representar el estado del aparcamiento (completo, plazas libres)" do
        expect(Funcion::LIBRES).not_to be(nil)
        expect(Funcion::LIBRES).to eq("Existen plazas libres")
        expect(Funcion::COMPLETO).not_to be(nil)
        expect(Funcion::COMPLETO).to eq("Lleno")
        expect(Funcion::NO_APARCADO).not_to be(nil)
        expect(Funcion::NO_APARCADO).to eq("El vehículo no está aparcado")
        expect(Funcion::APARCADO).not_to be(nil)
        expect(Funcion::APARCADO).to eq("El vehículo está aparcado")
      end
      it "Comprobacion de aparcamiento de coches" do 
        @parking1.Funcion_aparcar("Coche1")
      expect(@parking1.situacion_aparcamiento).to eq("Esta plaza está ocupada por Coche1")
      end
      describe "Funcion para calcular porcentaje de plazas de minusvalidos" do
        it "Calcular al menos 1 entre 40" do
          @parking1.plazas_totales_minusvalidos(10)
          expect(@parking1.plazas_minusvalidos_proporcion()).to eq(false) #pues la proporcion que hemos establecido es falsa
        end
      end
  describe "Funcion para calcular numero de plazas de minusválidos libres" do
    it "Prueba con valores concretos" do
     expect(@parking1.p_minusvalidos_libres(0)).to eq(0.0)
    end
  end
  describe "Funcion para calcular numero de vehiculos" do
    it "Caluclar con 5 estacionamientos llenos" do
      expect(@parking1.vehiculos_estacionados(10)).to eq("Hay 10 vehiculos")
    end
  end

  end
  describe Datos do
    before :all do
      @parking1 = Datos.new(2, 8, 3333, "ejemplo1", "Mixto", "coche", [{:altura => 3.0, :longitud => 6.0, :anchura => 7.0}], [["plaza1", "plaza2", "plaza3"], ["vacio", "ocupado", "vacio"]])
      @tfn = Datos.new(4, 8, 2222, "ejemplo2", "Mixto", "coche", [{:altura => 4.0, :longitud => 8.0, :anchura => 3.0}], [["plaza1", "plaza2", "plaza3"], ["Ocupado", "ocupado", "vacio"]])
      @tfs = Datos.new(5, 7, 4444, "ejemplo3", "Mixto", "coche", [{:altura => 7.0, :longitud => 8.0, :anchura => 4.0}], [["plaza1", "plaza2", "plaza3"], ["Ocupado", "vacio", "vacio"]])
     
    end
    it "Tiene una clase para almacenar los datos del aparcamiento" do
      expect(@parking1).to be_an_instance_of(Datos)
      expect(@tfn).to be_an_instance_of(Datos)
      expect(@tfn).to be_an_instance_of(Datos)
    end
      context "Herencia del módulo aparcamiento" do
      it "Se espera que un aparcamiento sea un objeto de la clase module" do
      expect(Aparcamiento).to be_an_instance_of(Module)
      end
      it "Se espera que un aparcamiento sea un objeto" do
      expect(Aparcamiento).is_a?(Object)
    end
    it "Se espera que un aparcamiento sea un BasicObject" do
      expect(Aparcamiento).is_a?(BasicObject)
    end
    it "Se espera que un aparcamiento sea un String" do
      expect(Aparcamiento.is_a? String).to eq(false)
    end
    it "Se espera que un aparcamiento sea un Numeric" do
      expect(Aparcamiento.is_a? Numeric).to eq(false)
    end
   
end

   

      it "tiene el atributo de accesibilidad (1..5)" do
        expect(@parking1.accesibilidad).not_to be(nil)
        expect(@parking1.accesibilidad).to eq(2)

      end
      it "tiene el atributo de seguridad (1..10)" do
        expect(@parking1.seguridad).not_to be(nil)
        expect(@parking1.seguridad).to eq(8)

      end
      it "tiene un atributo para su identificacion" do
        expect(@parking1.id).not_to be(nil)
        expect(@parking1.id).to eq(3333)
      end

      it "tiene un atributo para su nombre comercial" do
        expect(@parking1.nombre_comercial).not_to be(nil)
        expect(@parking1.nombre_comercial).to eq("ejemplo1")
      end

      it "Un aparcamiento tiene un atributo para su descripcion (Cubierto - Aire libre - Mixto)" do
      expect(@parking1.descripcion).not_to be(nil)
      expect(@parking1.descripcion).to eq("Mixto")
      end
      it "Atributo para el tipo de aparcamiento (autobuses, bicicletas, coches, motos)" do
      expect(@parking1.tipo).not_to be(nil)
      expect(@parking1.tipo).to eq("coche")
      end

      it "test de strings" do
      expect(@parking1.to_s).to eq("accesibilidad = 2  -  seguridad = 8  -  id = 3333  -  nombre comercial = ejemplo1  -  descripcion = Mixto  -  tipo = coche - altura => 3.0 longitud => 6.0 anchura => 7.0 ")
      end
      it "testeando dimensiones del aparcamiento" do
      expect(@parking1.dimensiones).to eq([{:altura => 3.0, :longitud => 6.0, :anchura => 7.0}])
      end

      it "método para devolver el número de plazas" do
      expect(@parking1.plazas_totales).not_to be(nil)
      expect(@parking1.plazas_totales()).to eq(3)
    end

    it "método para devolver el número de plazas vacias" do
      expect(@parking1.plazas_vacias).not_to be(nil)
      expect(@parking1.plazas_vacias()).to eq(2)
    end

    it "método para devolver el número de plazas ocupadas" do
      expect(@parking1.plazas_ocupadas).not_to be(nil)
      expect(@parking1.plazas_ocupadas()).to eq(1)
    end

    context "Herencia de la clase aparcamiento" do
    it "Se espera que la instancia de la clase datos, sean los datos de un aparcamiento" do
    expect(@parking1).instance_of?(Datos) 
    end

    it "Se espera que la instancia de la clase datos, sea un objeto" do
      expect(@parking1.is_a? Object).to eq(true)
      expect(Datos.is_a? Object).to eq(true)
    end
    it "Se espera que la instancia de la clase datos, sea un objeto básico" do
      expect(@parking1.is_a? BasicObject).to eq(true)
      expect(Datos.is_a? BasicObject).to eq(true)
    end
    it "Se espera que la instancia de la clase datos, sea un string" do
      expect(@parking1.is_a? String).to eq(false)
      expect(Datos.is_a? String).to eq(false)
    end
    it "Se espera que la instancia de la clase datos, sea un Numeric" do
      expect(@parking1.is_a? Numeric).to eq(false)
      expect(Datos.is_a? Numeric).to eq(false)
    end
    it "Se espera que la instancia de la clase datos, sea un Comparable" do
     expect(@tfn.is_a? Comparable).to eq(true)
    expect(@tfs.is_a? Comparable).to eq(true)
    end
  end
end 
end

RSpec.describe Vehiculo do
    it "Tiene un número de version usando la sintaxis semántica X, Y, Z" do
    expect(Vehiculo::VERSION).not_to be(nil)
  end
    before :all do
    @vehiculo1 = Vehiculos.new("Coche azul celeste", 7.0, 4.0, 10.0, 0.5)
    @vehiculo2 = Vehiculos.new("Coche rojo granate", 8.0, 6.0, 14.0, 0.7)
    @vehiculo3 = Vehiculos.new("Coche verde osucro", 2.0, 5.0, 10.0, 0.9)
  end
  
    describe "Representacion de un vehiculo - atributos" do
    it "Comprobando creacion de la clase" do
   # expect(@vehiculo1).to be_a(Datos)
    expect(@vehiculo1).to be_an_instance_of(Vehiculos)
    expect(@vehiculo2).to be_an_instance_of(Vehiculos)
    end

    it "Tiene un atributo para identificar el tipo de vehiculo" do
       expect(@vehiculo1.tipo_vehiculo).to eq("Coche azul celeste")
       expect(@vehiculo2.tipo_vehiculo).to eq("Coche rojo granate")
    end
    it "Tiene un atributo para representar la altura en metros" do
      expect(@vehiculo1.altura_metros).to eq(7.0)
      expect(@vehiculo2.altura_metros).to eq(8.0)
   end
   it "Tiene un atributo para representar el ancho en metros" do
    expect(@vehiculo1.ancho_metros).to eq(4.0)
    expect(@vehiculo2.ancho_metros).to eq(6.0)
   end

   it "Tiene un atributo para representar el largo en metros" do
    expect(@vehiculo1.largo_metros).to eq(10.0)
    expect(@vehiculo2.largo_metros).to eq(14.0)
   end

   it "Tiene un atributo para representar el peso en toneladas" do
    expect(@vehiculo1.peso_toneladas).to eq(0.5)
    expect(@vehiculo2.peso_toneladas).to eq(0.7)
   end

   it "Comprobando foramtado de strings" do
    expect(@vehiculo1.to_s).to eq("Tipo de Vehiculo = Coche azul celeste  -  Altura en metros = 7.0  -  Ancho en metros = 4.0  -  Largo en metros = 10.0  -  Peso en toneladas = 0.5")
    expect(@vehiculo2.to_s).to eq("Tipo de Vehiculo = Coche rojo granate  -  Altura en metros = 8.0  -  Ancho en metros = 6.0  -  Largo en metros = 14.0  -  Peso en toneladas = 0.7")
    end

    describe "Herencia de la clase vehiculo" do
    it "Se espera que la instancia de clase vehiculo, sea un vehiculo" do
    expect(@vehiculo1).instance_of?(Vehiculos) 
    expect(@vehiculo2).instance_of?(Vehiculos)
    end
    it "Se espera que la instancia de clase vehiculo, sea un objeto" do
      expect(@vehiculo1.is_a? Object).to eq(true)
      expect(@vehiculo2.is_a? Object).to eq(true)
    end

    it "Se espera que la instancia de clase vehiculo, sea un objeto básico" do
      expect(@vehiculo1.is_a? BasicObject).to eq(true)
      expect(@vehiculo2.is_a? BasicObject).to eq(true)
    end

    it "Se espera que la instancia de clase vehiculo, sea un String" do
      expect(@vehiculo1.is_a? String).to eq(false)
      expect(@vehiculo2.is_a? String).to eq(false)
    end

    it "Se espera que la instancia de clase vehiculo, sea un Numeric" do
      expect(@vehiculo1.is_a? Numeric).to eq(false)
      expect(@vehiculo2.is_a? Numeric).to eq(false)
    end
    it "Se espera que la instancia de clase vehiculo, sea un Comparable" do
      expect(@vehiculo1.is_a? Comparable).to eq(true)
      expect(@vehiculo2.is_a? Comparable).to eq(true)
    end
    it "Se espera que la instancia de clase vehiculo, sea un Enumerable" do
      expect(@vehiculo1.is_a? Enumerable).to eq(true)
      expect(@vehiculo2.is_a? Enumerable).to eq(true)
    end

    describe "Se cuenta el número de objetos de la clase vehiculos" do
    it "Número de objetos de vehiculo" do
      #expect(@vehiculos.objetos_vehiculo).to eq(1) - Para cuando solo tenía un vehiculo
      expect(@vehiculo1.objetos_vehiculo).to eq(3) 
      expect(@vehiculo2.objetos_vehiculo).to eq(3) 
      expect(@vehiculo3.objetos_vehiculo).to eq(3) 
    end
    end

    describe "Comprobando métodos de enumeracion" do
    it "Comprbando sorting" do
    expect(@vehiculo1.sort1(@vehiculo2, @vehiculo3)).to eq([2.0, 7.0, 8.0])
  end
  it "Comprbando collect" do
    expect(@vehiculo1.collect1(@vehiculo2, @vehiculo3)).to eq(["7.0", "8.0", "2.0"])
  end
  it "Comprbando each" do
    expect(@vehiculo1.each1(@vehiculo2, @vehiculo3)).to eq([7.0, 8.0, 2.0])
  end
  it "Comprbando select" do
    expect(@vehiculo1.select1(@vehiculo2, @vehiculo3)).to eq([2.0])
  end
  it "Comprbando max" do
    expect(@vehiculo1.max1(@vehiculo2, @vehiculo3)).to eq(8.0)
  end
  it "Comprbando min" do
    expect(@vehiculo1.min1(@vehiculo2, @vehiculo3)).to eq(2.0)
  end
  it "Comprbando detect" do
    expect(@vehiculo1.detect1(@vehiculo2, @vehiculo3)).to eq(2.0)
  end
  it "Comprbando reject" do
    expect(@vehiculo1.reject1(@vehiculo2, @vehiculo3)).to eq([7.0])
  end
  it "Comprbando take while" do
    expect(@vehiculo1.take_while1(@vehiculo2, @vehiculo3)).to eq([7.0])
  end
  it "Comprbando first (extraer primer elemento" do
    expect(@vehiculo1.first1(@vehiculo2, @vehiculo3)).to eq(7.0)
  end
  
  
  end

    describe "Comparando vehiculos segun su volumen" do #para satisfacer esta expectativa deberemos crear un nuevo vehiculo2
      it "Probando si vehiculo 1 tiene 'mayor valor' que vehiculo 2" do
        expect(@vehiculo1 > @vehiculo2).to eq(false) #no es cierto
      end
      it "Probando si vehiculo 1 tiene 'menor valor' que vehiculo 2" do
        expect(@vehiculo1 < @vehiculo2).to eq(true) #es cierto
      end
      it "Probando si vehiculo 1 tiene 'igual valor' que vehiculo 2" do
        expect(@vehiculo1 == @vehiculo2).to eq(false) #es falso
      end

      it "Probando si vehiculo 1 tiene 'mayor o igual valor' que vehiculo 2" do
        expect(@vehiculo1 >= @vehiculo2).to eq(false) #no es cierto
      end

      it "Probando si vehiculo 1 tiene 'menor o igual valor' que vehiculo 2" do
        expect(@vehiculo1 <= @vehiculo2).to eq(true) #es cierto
      end

      it "Probando si vehiculo 2 tiene 'mayor valor' que vehiculo 1" do
        expect(@vehiculo2 > @vehiculo1).to eq(true) # es cierto
      end
      it "Probando si vehiculo 2 tiene 'menor valor' que vehiculo 1" do
        expect(@vehiculo2 < @vehiculo1).to eq(false) #no es cierto
      end
      it "Probando si vehiculo 2 tiene 'igual valor' que vehiculo 1" do
        expect(@vehiculo2 == @vehiculo1).to eq(false) #no es cierto
      end
      it "Probando si vehiculo 2 tiene 'mayor o igual valor' que vehiculo 1" do
        expect(@vehiculo2 >= @vehiculo1).to eq(true) # es cierto
      end
      it "Probando si vehiculo 2 tiene 'menor o igual valor' que vehiculo 1" do
        expect(@vehiculo2 <= @vehiculo1).to eq(false) #no es cierto
      end
      it "Comprobando si los valores de vehiculo 1 se encuentran entre los valores de vehiculo 2 y 3" do
        expect(@vehiculo1.between?(@vehiculo2, @vehiculo3)).to eq(false)
        end
      end
     

    end
  end
end
require_relative "../lib/aparcamiento/motor"
RSpec.describe Motor do
  before :all do
    @motor1 = Motor.new(4, 5, 150, 200)
    @motor2 = Motor.new(6, 9, 169, 210)
    motor3 = Motor.new(1, 3, 20, 100 )
   end
   describe "Representacion de un vehiculo de motor - vehiculo::motor" do
    it "Comprobando creacion de la clase" do
    expect(@motor1).instance_of?(Motor) 
    expect(@motor2).instance_of?(Motor)
     end
    it "Tiene un atributo para el número de ruedas" do
      expect(@motor1.num_ruedas).to eq(4)
      expect(@motor2.num_ruedas).to eq(6)
    end
    it "Tiene un atributo para el numero de plazas" do
      expect(@motor1.num_pasajeros).to eq(5)
      expect(@motor2.num_pasajeros).to eq(9)
   end
    it "Tiene un atributo para la potencia del motor" do
      expect(@motor1.pot_motor).to eq(150)
      expect(@motor2.pot_motor).to eq(169)
   end
    it "Tieen un atributo para calcular la velocidad maxiam" do
    expect(@motor1.vel_max).to eq(200)
    expect(@motor2.vel_max).to eq(210)
    end

    it "Comprobando String" do
    expect(@motor1.to_s).to eq( "Numero de ruedas = 4  -  Numero de pasajeros = 5  -  Potencia del motor = 150  -  Velocidad Máxima = 200")
    expect(@motor2.to_s).to eq( "Numero de ruedas = 6  -  Numero de pasajeros = 9  -  Potencia del motor = 169  -  Velocidad Máxima = 210")
    end

    describe "Herencia de la clase motor" do
      it "Se espera que la instancia de clase motor, sea un motor" do
      expect(@motor1.instance_of? Motor).to eq(true) 
      expect(@motor2.instance_of? Motor).to eq(true)
      end
      it "Se espera que la instancia de clase motor, sea un objeto" do
        expect(@motor1.is_a? Object).to eq(true) 
        expect(@motor2.is_a? Object).to eq(true) 
      end
      it "Se espera que la instancia de clase motor, sea un objeto básico" do
        expect(@motor1.is_a? BasicObject).to eq(true)
        expect(@motor2.is_a? BasicObject).to eq(true)
      end
      it "Se espera que la instancia de clase motor, sea un String" do
        expect(@motor1.is_a? String).to eq(false)
        expect(@motor2.is_a? String).to eq(false)
      end 
      it "Se espera que la instancia de clase motor, sea un Numeric" do
        expect(@motor1.is_a? Numeric).to eq(false)
        expect(@motor2.is_a? Numeric).to eq(false)
      end
      it "Se espera que la instancia de clase motor, sea un Comparable" do
        expect(@motor1.is_a? Comparable).to eq(true)
        expect(@motor2.is_a? Comparable).to eq(true)
      end
      describe "Comparando vehiculos de motor según su numero de plazas" do
        it "Probando si vehiculo de motor 1 tiene mayor capacidad que vehiculo de motor 2" do
          expect(@motor1 > @motor2).to eq(false) #no es cierto
        end
        it "Probando si vehiculo de motor 1 tiene menor capacidad que vehiculo de motor 2" do
          expect(@motor1 < @motor2).to eq(true) #es cierto
        end
        it "Probando si vehiculo de motor 1 tiene mayor o igual capacidad que vehiculo de motor 2" do
          expect(@motor1 >= @motor2).to eq(false) #no es cierto
        end
        it "Probando si vehiculo de motor 1 tiene menor o igual capacidad que vehiculo de motor 2" do
          expect(@motor1 <= @motor2).to eq(true) #es cierto
        end
        it "Probando si vehiculo de motor 1 tiene igual capacidad que vehiculo de motor 2" do
          expect(@motor1 == @motor2).to eq(false) #es falso
        end
        it "Probando si vehiculo de motor 2 tiene mayor capacidad que vehiculo de motor 1" do
          expect(@motor2 > @motor1).to eq(true) #es cierto
        end
        it "Probando si vehiculo de motor 2 tiene menor capacidad que vehiculo de motor 1" do
          expect(@motor2 < @motor1).to eq(false) #no es cierto
        end
        it "Probando si vehiculo de motor 2 tiene igual capacidad que vehiculo de motor 1" do
          expect(@motor2 == @motor1).to eq(false) #no es cierto
        end
        it "Comprobando si los valores de motor 1 se encuentran entre los valores de motor 2 y 3" do
          expect(@motor1.between?(@motor2, @motor3)).to eq(false)
        end
        end
              
        end
      end
    end

require_relative "../lib/aparcamiento/estacionamiento_tren"
RSpec.describe Estacionamiento_tren do
  before :all do
    @tren1 = Estacionamiento_tren.new(20, 400, 3, 0.10, 5, {:altura => 10.0, :largo => 10.0, :anchura => 10.0, :espacio_lateral => 10.0})
   end
   describe "Representacion de un Estacionamiento de trenes" do
    it "Comprobando creacion de la clase" do
    expect(@tren1).instance_of?(Estacionamiento_tren) 
    end
    it "Comprobando polimorfismo" do
      expect(@tren1.respond_to?(:Funcion_aparcar)).to eq(true) 
      end

    it "Comprobando que tiene un atributo para contar el numero de plazas de larga estancia" do
    expect(@tren1.n_plzas_larga_estancia).to eq(20)
    end
  end
  describe "Funcion para calcular horas del vehiculo estacionado" do
  it  "Calculo de horas totales" do
  @tren1.Duracion(16.0, 12.0)
  expect(@tren1.duracion_estimada).to eq(4)
  end
  end
  describe "Funcion para calcular precio final" do
    it  "Expectativa de precio final" do
    @tren1.Precio_a_pagar(4)
    expect(@tren1.coste_total).to eq(0.4)
    #expect(@tren1.precio_min).to eq(0.10)
    end
    end

  end


  require_relative "../lib/aparcamiento/estacionamiento_avion"
  RSpec.describe Estacionamiento_avion do
  before :all do
    @avion1 = Estacionamiento_avion.new(5, 400, 3, 0.10, 5, {:altura => 10.0, :longitud => 10.0, :anchura => 10.0, :espacio_lateral => 10.0})
    @tfn = Estacionamiento_avion.new(5, 400, 3, 0.10, 5, {:altura => 10.0, :longitud => 10.0, :anchura => 10.0, :espacio_lateral => 10.0})
    @tfs = Estacionamiento_avion.new(2, 500, 4, 0.20, 5, {:altura => 12.0, :longitud => 15.0, :anchura => 16.0, :espacio_lateral => 17.0})
    @bcn = Estacionamiento_avion.new(2, 500, 4, 0.20, 5, {:altura => 12.0, :longitud => 15.0, :anchura => 16.0, :espacio_lateral => 17.0})
   end
   describe "Representacion de un Estacionamiento de aviones" do
    it "Comprobando creacion de la clase" do
    expect(@tren1).instance_of?(Estacionamiento_avion) 
    end
    it "Comprobando polimorfismo" do
      expect(@avion1.respond_to?(:Funcion_aparcar)).to eq(true) 
      end

    it "Comprobando que tiene un atributo para contar el numero de plantas" do
    expect(@avion1.n_plantas).to eq(5)
    end
  end
  describe "prueba de indices" do
  it "probando indice de tfs" do
    #puts @tfs.distancia
    #puts @tfs.ind_sostenibilidad
  expect(@tfs.ind_sostenibilidad).to eq(0)
   # puts @tfn.distancia
   #puts @tfn.ind_sostenibilidad
   expect(@tfn.ind_sostenibilidad).to eq(0)
   puts @tfs.ind_sostenibilidad
end
context "Indice de sostenibilidad calculado desde los atributos heredados de aeropuerto" do
  it "Se espera que Datos de un aparcamiento sea un comparable" do
   expect(Datos.is_a? Comparable).to eq(false)
 end
 it "Probando si tfs tiene 'mayor valor' que tfn" do
   expect(@tfs > @tfn).to eq(false) 
 end
 it "Probando si tfs tiene 'menor valor' que tfn" do
   expect(@tfs < @tfn).to eq(false) 
 end
 it "Probando si tfs tiene 'igual valor' que tfn" do
   expect(@tfs == @tfn).to eq(true) 
 end

 it "Probando si tfs tiene 'mayor o igual valor' que tfn" do
   expect(@tfs >= @tfn).to eq(true) 
 end

 it "Probando si tfn tiene 'menor o igual valor' que tfs" do
   expect(@tfs <= @tfn).to eq(true) 
 end

 it "Probando si tfn tiene 'mayor capacidad' que tfs" do
   expect(@tfn > @tfs).to eq(false) 
 end
 it "Probando si tfn tiene 'menor capcidad' que tfs" do
   expect(@tfn < @tfs).to eq(false) 
 end
 it "Probando si tfn tiene 'igual capacidad' que tfs" do
   expect(@tfn == @tfs).to eq(true) 
 end
 it "Probando si tfn tiene 'mayor o igual valor' tfs" do
  expect(@tfn >= @tfs).to eq(true) 
 end
 it "Probando si tfn 'menor o igual valor' que tfs" do
  expect(@tfn <= @tfs).to eq(true) 
 end
 it "Comprobando si los valores de tfn se encuentran entre los valores de tfs y bcn" do
  expect(@tfn.between?(@tfs, @bcn)).to eq(true)
 end
 end
end
  describe "Funcion para calcular horas del vehiculo estacionado" do
    it  "Calculo de horas totales" do
    @avion1.Duracion(20.0, 12.0)
    expect(@avion1.duracion_estimada).to eq(8.0)
    end
    end
    describe "Funcion para calcular precio final" do
      it  "Expectativa de precio final" do
      @avion1.Precio_a_pagar(8)
      expect(@avion1.coste_total).to eq(0.8)
      end
      end
  
end

RSpec.describe Aparcamiento do
  before :all do
    @parking1 = Datos.new(2, 8, 1111, "ejemplo1", "Mixto", "coche", [{:altura => 3.0, :longitud => 6.0, :anchura => 7.0}], [["1", "2", "3", "4", "5", "6", "7"], ["vacio", "ocupado", "vacio", "ocupado", "vacio", "ocupado", "vacio"]])
    @parking1.setterPract10(12, 0.18)
    @parking1.setterPMinusvalidos(19, 0)

    @parking2 = Datos.new(2, 8, 2222, "ejemplo2", "Mixto", "coche", [{:altura => 3.0, :longitud => 6.0, :anchura => 7.0}], [["1", "2", "3", "4", "5", "6", "7"], ["vacio", "ocupado", "vacio", "ocupado", "vacio", "ocupado", "vacio"]])
    @parking2.setterPract10(100, 0.70)
    @parking2.setterPMinusvalidos(10, 1)
  
    @parking3 = Datos.new(2, 8, 3333, "ejemplo3", "Mixto", "coche", [{:altura => 3.0, :longitud => 6.0, :anchura => 7.0}], [["1", "2", "3", "4", "5", "6", "7"], ["vacio", "ocupado", "vacio", "ocupado", "vacio", "ocupado", "vacio"]])
    @parking3.setterPract10(69, 0.09)
    @parking3.setterPMinusvalidos(5, 0)

    @parking4 = Datos.new(2, 8, 4444, "ejemplo4", "Mixto", "coche", [{:altura => 3.0, :longitud => 6.0, :anchura => 7.0}], [["1", "2", "3", "4", "5", "6", "7"], ["vacio", "ocupado", "vacio", "ocupado", "vacio", "ocupado", "vacio"]])
    @parking4.setterPract10(96, 0.96)
    @parking4.setterPMinusvalidos(5, 0)
   
  end 
  describe "Expevtativas practica 10" do
    it "Indicar cual es el mejor parking con plazas libres" do
    expect(([@parking1, @parking2, @parking3, @parking4].select{|n| n.plazas_vacias > 0}).max{|n| n.ind_sostenibilidad}).to eq(@parking3)

  end 
  it "Indicar cual es el mejor parking con plazas de minusvalidos libres" do
   expect(([@parking1, @parking2, @parking3, @parking4].select{|n| n.getterPMinusvalidoslibres2 > 0}).max{|n| n.ind_sostenibilidad}).to eq(@parking3)
  end 
  it "Calculando porcentaje de plazas libres en parking 1" do
   expect(@parking1.porcentaje_aparcamiento).to eq(57.14)
 #puts @parking1.porcentaje_aparcamiento
   end 
   it "Calculando porcentaje de plazas libres en parking 2" do
    expect(@parking2.porcentaje_aparcamiento).to eq(57.14)
  #puts @parking1.porcentaje_aparcamiento
    end 
    it "Calculando porcentaje de plazas libres en parking 3" do
      expect(@parking3.porcentaje_aparcamiento).to eq(57.14)
    #puts @parking1.porcentaje_aparcamiento 
end
it "Calculando porcentaje de plazas libres en parking 4" do
  expect(@parking4.porcentaje_aparcamiento).to eq(57.14)
#puts @parking1.porcentaje_aparcamiento
end
it "Calculando porcentaje de plazas ocupadas de minusvalidos en parking 1" do
  expect(@parking1.porcentaje_aparcamiento_min).to eq(0.0)
#puts @parking1.porcentaje_aparcamiento
end
it "Calculando porcentaje de plazas ocupadas de minusvalidos en parking 2" do
  expect(@parking2.porcentaje_aparcamiento_min).to eq(10.0)
  #puts @parking2.p_minusvalidos
  #puts @parking2.p_minusvalidos_ocupadas
  #puts @parking2.porcentaje_aparcamiento_min
end
  it "Calculando porcentaje de plazas ocupadas de minusvalidos en parking 3" do
    expect(@parking3.porcentaje_aparcamiento_min).to eq(0.0)
  end
  it "Calculando porcentaje de plazas ocupadas de minusvalidos en parking 4" do
    expect(@parking4.porcentaje_aparcamiento_min).to eq(0.0)
  end
end
end
require_relative "../lib/aparcamiento/aparcamiento_dsl"
RSpec.describe Aparcamiento do

describe "Lenguaje de Dominio específico - DSL " do
describe"Atributos de la clase AparcamientoDSL" do
  before :all do
    @aparcamiento_tenerife = Aparcamiento::AparcamientoDSL.new("APARCAMIENTOS TENERIFE") do
      registrar "tfn",    :plazas_larga_estancia => 3,
                                    :distancia => 10,
                                    :numero_plazas_minusvalidos => 1,
                                    :precio_min => 0.60,
                                    :vehiculos => ["audi"],
                                    :id => 0111,
                                    :nombre_comercial => "ejemplo",
                                    :descripcion => :cubierto,
                                    :tipo => :autobuses,
                                    :dimensiones => {:altura => 5.0, :longitud => 5.0, :anchura => 2.20},
                                    :plazas => [:ocupada, :libre, :libre]
                
                registrar "tfs",    :plazas_larga_estancia => 3,
                                    :distancia => 10,
                                    :numero_plazas_minusvalidos => 1,
                                    :precio_min => 0.69,
                                    :vehiculos => ["audi"],
                                    :id => 0222,
                                    :nombre_comercial => "ejemplo",
                                    :descripcion => :cubierto,
                                    :tipo => :autobuses,
                                    :dimensiones => {:altura => 5.0, :longitud => 5.0, :anchura => 2.20},
                                    :plazas => [:ocupada, :libre, :libre]   
                        
                solicitar "aparcamiento coches", :id => :coches,
                                    :altura => 4.0,
                                    :ancho => 2.0, 
                                    :largo => 2.0,
                                    :peso => "irrelevante"
                
                solicitar "aparcamiento autobuses", :id => :autobuses,
                                    :altura => 2.0,
                                    :ancho => 2.0, 
                                    :largo => 5.0,
                                    :peso => "irrelevante"


    end
end
end 
it "Tiene una clase para almacenar los datos de la clase aparcamientoDSL" do
  expect(Aparcamiento::AparcamientoDSL).not_to eq(nil)
end
it "Tiene un método para los regitrar los datos de registro" do
  expect(Aparcamiento::AparcamientoDSL.method_defined?(:registrar)).to eq(true)
end
it "Tiene un método para los regitrar los datos de una solicitud de entrada" do
  expect(Aparcamiento::AparcamientoDSL.method_defined?(:solicitar)).to eq(true)
end
it "Se obtiene un string con la información correctamente formateada" do
  expect(@aparcamiento_tenerife.to_s).not_to eq(nil)
end

end

end