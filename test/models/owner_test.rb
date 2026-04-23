require "test_helper"

class OwnerTest < ActiveSupport::TestCase
  test "debe ser válido con todos los atributos" do
    owner = Owner.new(first_name: "Ana", last_name: "Rojas", email: "ana@vet.com", phone: "12345")
    assert owner.valid?
  end

  test "no debe guardar sin email" do
    owner = Owner.new(first_name: "Ana", phone: "123")
    assert_not owner.save
    assert_includes owner.errors[:email], "can't be blank"
  end

  test "el email debe tener formato válido" do
    owner = Owner.new(email: "correo-invalido")
    assert_not owner.valid?
  end
end