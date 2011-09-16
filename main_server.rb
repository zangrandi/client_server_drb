require 'drb'

class MainServer
  def initialize server_list
    @servers = []
    DRb.start_service #inicia os servicos
    server_list.each { |server|  x = DRbObject.new_with_uri server
                                  @servers << x }
  end
  def sort_a_server
    @servers.sample
  end
  def solve member
    server_solver = sort_a_server
    server_solver.calculate member    
  end
end


mainserver = MainServer.new ["druby://127.0.0.1:2015", "druby://127.0.0.1:2016"] #enviando uma lista de servidores validos
p "resolvendo 1+1..."
p mainserver.solve "1+1"

