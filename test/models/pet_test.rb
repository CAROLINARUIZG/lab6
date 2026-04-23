require "test_helper"

class PetTest < ActiveSupport::TestCase
  setup do
    @owner = Owner.create!(first_name: "Test", last_name: "Owner", email: "p@test.com", phone: "1")
  end

  test "especie debe estar en la lista permitida" do
    pet = Pet.new(name: "Rex", species: "Dragon", owner: @owner) 
    assert_not pet.valid?
  end

  test "fecha de nacimiento no puede ser futura" do
    pet = Pet.new(name: "Rex", species: "Dog", date_of_birth: Date.today + 1.day, weight: 5, owner: @owner)
    assert_not pet.valid?
  end

  test "peso debe ser mayor a cero" do
    pet = Pet.new(name: "Rex", species: "Dog", weight: -1, owner: @owner)
    assert_not pet.valid?
  end
end