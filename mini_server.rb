require 'drb'

class Mini_server
  def calcular_resultado_de expressao
    eval expressao
  end
  def cadastrar_no_servidor_principal 
    true
  end
end
