require './server.rb'

server = Server.new 1236
DRb.start_service "druby://127.0.0.1:" << server.port, server
DRb.thread.join 
