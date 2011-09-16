require './server.rb'
require 'drb'

server = Server.new 2015
DRb.start_service "druby://127.0.0.1:" << server.port, server
p "servidor 1 iniciado"

server2 = Server.new 2016
DRb.start_service "druby://127.0.0.1:" << server2.port, server2
p "servidor 2 iniciado"

DRb.thread.join 
