# frozen_string_literal: true

require_relative "aparcamiento/version"
require_relative "aparcamiento/funcion"
require_relative "aparcamiento/datos"
require_relative "aparcamiento/vehiculo"
require_relative "aparcamiento/motor"
require_relative "aparcamiento/estacionamiento_tren"
require_relative "aparcamiento/estacionamiento_avion"

module Aparcamiento
end
module Vehiculo
  class Error < StandardError; end
  # Your code goes here...
end