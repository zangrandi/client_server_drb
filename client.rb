#coding: utf-8

require './main_server.rb'

main_server = MainServer.new
main_server.register "druby://127.0.0.1:2015"
main_server.register "druby://127.0.0.1:2016"

class String
  def expression?
    self.match /\A([\d|+|-|\/|*]+)\z/
  end
end

begin  
  input = gets.chomp
  input.expression? ? (p main_server.calculate input) : (p "não é uma expressão")
end until input == "quit"

