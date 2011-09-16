require 'drb'

class Server
  def initialize port
    @port = port.to_s
    DRb.start_service "druby://127.0.0.1:" << @port, self
    DRb.thread.join 
  end
  def calculate member
    eval member    
  end
end


server = Server.new 1236

