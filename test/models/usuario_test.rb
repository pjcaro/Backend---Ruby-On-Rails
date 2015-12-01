require 'test_helper'

class UsuarioTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end

  test "debe crear usuario" do 
  	u = Usuario.new(username: "pablo", email: "pablo@gmail.com", password: "12345678")
  	assert u.save
  end

  test "debe crear un usuario sin email" do 
  	u = Usuario.new(username: "pablo", password: "123456789")
  	assert u.save
  end
end
