class NeighborhoodsController < ApplicationController
    def index
        hoods = Neighborhood.joins(:neighbors).where(neighbors: {user_id: params[:user_id]})
        #authorize! :read, hoods.first
        render json: hoods, status: :ok
    end

    def search
        @user = User.find(params[:user_id])
        @neighborhoods = Neighborhood.all.select {|hood| hood.distance_to(@user) <= params[:radius].to_i}
        render json: @neighborhoods, status: :ok
    end
    def find
        places = Geocoder.search(params[:q])
        render json: places.as_json, status: :ok
    end

    def create
        @neighborhood = Neighborhood.new(neighborhood_params)
        if @neighborhood.valid?
            @neighborhood.save
            render json: @neighborhood, status: :ok
        else
            render json: {errors: @neighborhood.errors.full_messages}, status: :unprocessable_entity
        end
    end

    def neighborhood_params
        params.permit(:name, :latitude, :longitude)
    end
end
