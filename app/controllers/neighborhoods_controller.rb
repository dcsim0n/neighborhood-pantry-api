class NeighborhoodsController < ApplicationController
    def index
        hoods = Neighborhood.joins(:neighbors).where(neighbors: {user_id: params[:user_id]})
        authorize! :read, hoods.first
        render json: hoods, status: :ok
    end
end
