class NeighborsController < UserResourcesController
    
    def new_resource
        neighbor = Neighbor.new(neighbor_params)
        
    end

    def associated_resources
        User.find(params[:user_id]).neighborhoods
    end
    def nested_response(neighbor)
        
        neighbor.user.neighborhoods
    end
    def neighbor_params
        params.permit(:user_id,:neighborhood_id)
    end
end