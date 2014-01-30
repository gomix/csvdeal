class Code < ActiveRecord::Base
  attr_accessible :code
  attr_accessible :tomado
  after_initialize :init
  # Códigos numéricos para los códigos de barra de cada envío
  # rrrrrr12345678 (r = reservado, primera serie 000000)
  # primera serie I00000.00000001,I00000.009999 (el punto no va, es solo para no perderme)


  BASE="I00000"
  DIGITOS_VALIDOS=8
  DIGITO_DE_RELLENO="0"

  def init
    self.tomado ||= false
  end

 def self.agregar(cantidad=1)
    defaults = {}
    numero = last ? ( last.code.slice(6..13).to_i + 1 ) : 1
    ( (numero)..(numero+cantidad-1) ).each do |n|
      Code.create :code => generar( n )
    end
 end

 def self.generar(numero)
    resultado = rellenar(numero)
    BASE+resultado
 end

 def self.rellenar(num)
   s = DIGITO_DE_RELLENO*DIGITOS_VALIDOS
   s.insert(-(num.to_s.length + 1), num.to_s)[0, s.length - num.to_s.length] if num.to_s.length <= s.length
 end

end
