#coding: utf-8
require './domain_server.rb'


class String
  def expression?
    self.match /\A[\d+|+|\-|\/|*|sqrt\(\d+\)]+\z/
  end
end

server = DRbObject.new_with_uri "druby://127.0.0.1:2000"

begin  
  input = gets.chomp
  p input.expression? ? (server.calculate input) : "não é uma expressão"
end until input == "quit"

