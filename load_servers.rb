require './server.rb'
require './domain_server.rb'
require 'drb'

domain_server = DomainServer.new
DRb.start_service "druby://127.0.0.1:2017", domain_server
p "DNS iniciado"

server = Server.new 2015
DRb.start_service "druby://127.0.0.1:#{server.port}", server
server.register_on domain_server
p "servidor 1 iniciado"

server2 = Server.new 2016
DRb.start_service "druby://127.0.0.1:#{server2.port}", server2
server.register_on domain_server
p "servidor 2 iniciado"


DRb.thread.join 
