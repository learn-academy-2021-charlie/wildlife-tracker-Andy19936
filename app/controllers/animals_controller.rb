class AnimalsController < ApplicationController
    def index
        animal = Animal.all
        render json: animal
    end

    def update
        animal = Animal.find(params[:id])
        animal.update(animal_params)
        if animal.valid?
        render json: animal
        else 
        render json: animal.errors
        end
    end

    def create 
        animal = Animal.create(animal_params)
        if animal.valid?
            render json: animal
        else
            render json: animal.errors
        end
    end

    def destroy 
        animal = Animal.find(animal_params[:id])
        animal.destroy(animal_params)

    private 
    def animal_params
        params.require(:animal).permit(:common_name, :latin_name, :kingdom)
    end
end
