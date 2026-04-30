class PetsController < ApplicationController
  def index
    @pets = Pet.all.includes(:owner)
  end

  def show
    @pet = Pet.find(params[:id])
  end

  def pet_params
    params.require(:pet).permit(:name, :breed, :date_of_birth, :weight, :owner_id)
  end
  
end
