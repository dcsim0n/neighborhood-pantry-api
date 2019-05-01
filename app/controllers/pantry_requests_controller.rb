class PantryRequestsController < UserResourcesController
    
    def show
        request = PantryRequest.find(params[:id])
        authorize! :read, request
        render json: request.as_json({include: [{user: {only:[:id, :first_name]}},:offers]}), status: :ok
    end

    private
    def find_resource
        PantryRequest.find(params[:id])
    end

    def associated_resources
        PantryRequest.where(user_id: params[:user_id])
    end

    def new_resource
        request_attributes = resource_params
        #grab the user_id from the url param
        request_attributes = request_attributes.merge(user_id: params[:user_id])
        PantryRequest.new(request_attributes)
    end

    def resource_params
        params.require(:pantry_request).permit(:name, :quantity, :unit)
    end
end
