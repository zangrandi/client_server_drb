require './mini_server.rb'
describe Mini_server do
  it 'Calcular Resultado de expressoes' do
    servidor = Mini_server.new
    resultado = servidor.calcular_resultado_de "(2+3*5)+(6*2-3)"
    resultado.should == 26
  end
end
