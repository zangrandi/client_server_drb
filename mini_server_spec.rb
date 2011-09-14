require './mini_server.rb'
describe Mini_server do
  before(:each) do
    @miniservidor = Mini_server.new
  end
  it 'Calcular Resultado de expressoes' do
    resultado = @miniservidor.calcular_resultado_de "(2+3*5)+(6*2-3)"
    resultado.should == 26
  end
  it 'Cadastro no servidor principal' do
    cadastro = @miniservidor.cadastrar_no_servidor_principal
    cadastro.should == true
  end
end
