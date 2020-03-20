class PetsController < ApplicationController
  def index
    @pets = Pet.all
  end

  def new
    @shelter_id = params[:id]
  end

  def create
    shelter = Shelter.find(params[:id])
    pet = shelter.pets.create!(pet_params)
    redirect_to "/shelters/#{shelter.id}/pets"
  end

  def show
    @pet = Pet.find(params[:id])
  end

  def edit
    @pet = Pet.find(params[:id])
  end

  def update
    pet = Pet.find(params[:id])
    pet.update({name: params[:pet][:name],
      image: params[:pet][:image],
      description: params[:pet][:description],
      age: params[:pet][:age],
      sex: params[:pet][:sex],
      })
      pet.save
      redirect_to "/pets/#{pet.id}"
  end

private

  def pet_params
    params.permit(:name, :age, :sex)
  end

end
