require 'drb'

class DomainServer
  attr_reader :port
  
  def initialize port, ui
    @servers = []
    @ui = ui
    @port = port
    
    DRb.start_service
  end
  
  def start_message
    "DNS now running at address #{address}"
  end  
  
  def address
    "druby://127.0.0.1:#{@port}"
  end
  
  def register server
    x = DRbObject.new_with_uri server
    @servers << x
  end
  
  def calculate expression
    @expression = expression
    
    solve pows
    solve square_roots
    solve multiplications
    solve divisions
    solve subtractions
    solve sums
    
    return @expression
  end
  
  private
  def solve regexp
    begin
      @expression.gsub!(regexp) do |operation|
        server = sort_one_server
        result = server.calculate operation
        @ui.puts "#{operation}: #{result} calculated by server at address #{server.address}"
        result
      end
    end until !@expression.match regexp
  end
  
  def multiplications
    /(\d+\s?[*]\s?\d+)/
  end
  
  def divisions
    /(\d+\s?[\/]\s?\d+)/
  end
  
  def sums
    /(\d+\s?[+]\s?\d+)/
  end
  
  def subtractions
    /(\d+\s?[\-]\s?\d+)/
  end
  
  def square_roots
    /sqrt\((\d+)\)/    
  end
  
  def pows
    /(\d+\s?[*][*]\s?\d+)/
  end
  
  def sort_one_server
    available_servers.sample
  end
  
  def available_servers
    @servers.select {|server| server.state == :available}
  end
end

