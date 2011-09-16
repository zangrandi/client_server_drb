require 'drb'

class MainServer
  def initialize 
    @servers = []
    DRb.start_service
  end
  
  def register server
    x = DRbObject.new_with_uri server
    @servers << x
  end
  
  def sort_one_server
    available_servers.sample
  end
  
  def available_servers
    @servers.select {|server| server.state == :available}
  end
  
  def calculate expression
    server = sort_one_server
    "result: #{server.calculate expression} calculated by server in port #{server.port}"
  end
end
