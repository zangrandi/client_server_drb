require './server.rb'
require 'drb'
p "inciando o segundo servidor..."
server2 = Server.new 2016

DRb.start_service "druby://127.0.0.1:" << server.port, server2
