class Server
  attr_accessor :state
  attr_reader :port
  
  def initialize port
    @port = port.to_s
    @state = :available
  end
  
  def calculate expression
    eval expression.to_s    
  end
  
  def register_on domain_server
    domain_server.register "druby://127.0.0.1:#{@port}"
  end
end
