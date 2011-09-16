require './server.rb'

describe 'Server' do
  before(:each) do
    @server = Server.new 1000
  end
  it 'Calcula uma equacao' do    
    resultado = @server.calculate "1+1"
    resultado.should == 2
  end
  
end
