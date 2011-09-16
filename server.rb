

class Server
  attr_accessor :port
  def initialize port
    @port = port.to_s

  end
  def calculate member
    eval member.to_s    
  end
end

