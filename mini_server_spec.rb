require 'drb'

class Mini_server
  def calcular_resultado_de(expressao)
    eval(expressao)
  end
end
