#coding: utf-8

class Server
  attr_accessor :state
  attr_reader :port
  
  def initialize port
    @port = port.to_s
    @state = :available
  end
  
  def calculate expression
    if expression.match divisao_por_zero?
      throw "Erro divisão por zero"
    elsif expression.match raiz?
      Math.sqrt($1.to_f)
    else
      eval expression.to_s[/[\d+|\s|+|\-|\/|*]+/]
    end
  end
  
  def register_on domain_server
    if domain_server.register "druby://127.0.0.1:#{@port}"
      puts "Server now registered on DNS #{domain_server.address} and running at #{address}"    
    end
  end
  
  def address
    "druby://127.0.0.1:#{@port}"
  end
  
  private
  def divisao_por_zero?
    /\d+\s?\/\s?[0]/
  end
  
  def raiz?
    /sqrt\(((\d+))\)/
  end
end
