class SightingsController < ApplicationController
    def index
        sightings = Sighting.all
        render json: sightings
    end

    def update
        sighting = Sighting.find(params[:id])
        sighting.update(sighting_params)
        if sighting.valid?
        render json: sighting
        else 
        render json: sighting.errors
        end
    end

    def create 
        sighting = Animal.create(animal_params)
        if animal.valid?
            render json: animal
        else
            render json: animal.errors
        end
    end

    def destroy 
        sighting = Sighting.find(params[:id])
        if sighting.destroy 
            render json: sighting
        else
            render json:sighting.errors
        end
    end

    private 
    def sighting_params
        params.require(:sighting).permit(:date, :latitude, :longitude, :animal_id)
    end
end