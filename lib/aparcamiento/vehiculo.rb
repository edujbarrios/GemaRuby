
class Vehiculos
    include Comparable
    include Enumerable

    attr_reader :tipo_vehiculo, :altura_metros, :ancho_metros, :largo_metros, :peso_toneladas
def initialize(tipo_vehiculo, altura_metros, ancho_metros, largo_metros, peso_toneladas)
    @tipo_vehiculo = tipo_vehiculo
    @altura_metros = altura_metros
    @ancho_metros = ancho_metros
    @largo_metros = largo_metros
    @peso_toneladas = peso_toneladas
    
    if defined? @@contador_objetos
        @@contador_objetos += 1
    else
        @@contador_objetos = 1
    end
end

def objetos_vehiculo
    @@contador_objetos
end

def to_s 
    "Tipo de Vehiculo = #{@tipo_vehiculo}  -  Altura en metros = #{@altura_metros}  -  Ancho en metros = #{@ancho_metros}  -  Largo en metros = #{@largo_metros}  -  Peso en toneladas = #{@peso_toneladas}"
end

def <=> (volumen)
    @altura_metros * @ancho_metros * largo_metros <=> (volumen.altura_metros * volumen.ancho_metros * volumen.largo_metros)
end


def sort1(objeto1, objeto2)
   a = [altura_metros, objeto1.altura_metros, objeto2.altura_metros].sort
   return a
  end

  def collect1(objeto1, objeto2)
    b = [altura_metros, objeto1.altura_metros, objeto2.altura_metros].collect{ |i| i.to_s}
    return b
  end

  def each1(objeto1, objeto2)
    c = [altura_metros, objeto1.altura_metros, objeto2.altura_metros].each{ |i| }
    return c
  end

  def select1(objeto1, objeto2)
    d = [altura_metros, objeto1.altura_metros, objeto2.altura_metros].select { |i| i.between?(1.0 ,5.0)}
    return d 
  end
  def max1(objeto1, objeto2)
    e = [altura_metros, objeto1.altura_metros, objeto2.altura_metros].max
    return e
  end
  def min1(objeto1, objeto2)
    f = [altura_metros, objeto1.altura_metros, objeto2.altura_metros].min
    return f
  end
  def detect1(objeto1, objeto2)
    g = [altura_metros,objeto1.altura_metros, objeto2.altura_metros].detect{ |i| i.between?(1,4)}
    return g
end
def reject1(objeto1, objeto2)
  h = [altura_metros,objeto1.altura_metros, objeto2.altura_metros].reject{ |i| i % 2 == 0 }
  return h
end
def take_while1(objeto1, objeto2)
  j = [altura_metros,objeto1.altura_metros, objeto2.altura_metros].take_while{ |i| i < 8.0 }
  return j
end

def first1(objeto1, objeto2)
  k = [altura_metros,objeto1.altura_metros, objeto2.altura_metros].first
  return k
end
end