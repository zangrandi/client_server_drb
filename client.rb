#coding: utf-8
require './domain_server.rb'


class String
  def expression?
    self.match /\A([\d|+|-|\/|*]+)\z/
  end
end

main_server = DRbObject.new_with_uri "druby://127.0.0.1:2017"

begin  
  input = gets.chomp
  p input.expression? ? (main_server.calculate input) : ("não é uma expressão")
end until input == "quit"

