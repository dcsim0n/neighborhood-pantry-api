class NeighborhoodsController < ApplicationController
    def index
        hoods = Neighborhood.joins(:neighbors).where(neighbors: {user_id: params[:user_id]})
        #authorize! :read, hoods.first
        render json: hoods, status: :ok
    end

    def show
        neighborhood = Neighborhood.find(params[:id])
        authorize! :read, neighborhood
        requests = neighborhood.pantry_requests.order(:created_at).includes(:user)
        items = neighborhood.pantry_items.order(:created_at).includes(:user)
        #at some point maybe the address should be here too?
        #also we will eventually want to include the offers and claims here
        json_requests = requests.as_json({:include =>{:user=>{only:[:id,:first_name,:last_name]}}})
        json_items = items.as_json({:include =>{:user=>{only:[:id,:first_name,:last_name]}}})
        render json: {requests: json_requests, items: json_items}, status: :ok
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
    private
    def neighborhood_params
        params.permit(:name, :latitude, :longitude)
    end
end
