class OwnersController < ApplicationController
  def index
    @owners = Owner.all.includes(:pets)
  end

  def show
    @owner = Owner.find(params[:id])
  end
end
