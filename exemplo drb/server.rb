require 'drb'  #biblioteca RPC
class Foo #uma classe qualquer
  def HelloWorld
    "Helllllllooooo World"
  end
end
DRb.start_service "druby://localhost:2250", Foo.new #inicia o servico RPC servindo a classe Foo, "druby://localhost:2250" eh a uri => endereço e porta do servidor
DRb.thread.join #fica esperando conexao com clientes
