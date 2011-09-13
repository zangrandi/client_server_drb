require 'drb'
DRb.start_service #inicia o servico
bar = DRbObject.new nil, "druby://localhost:2250" #cria um objeto da classe remota
puts bar.HelloWorld #chama um metodo remoto
