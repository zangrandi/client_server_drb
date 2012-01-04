require './server.rb'
require './domain_server.rb'
require 'drb'

def load_server port, domain_server
  server = Server.new port
  DRb.start_service "druby://127.0.0.1:#{server.port}", server
  server.register_on domain_server  
  server
end

domain_server = DomainServer.new 2000, STDOUT
DRb.start_service "druby://127.0.0.1:#{domain_server.port}", domain_server

server = load_server 2015, domain_server
server2 = load_server 2016, domain_server
server3 = load_server 2017, domain_server
server4 = load_server 2018, domain_server

DRb.thread.join 
