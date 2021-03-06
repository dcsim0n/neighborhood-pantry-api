class PantryItemsController < UserResourcesController

    def show
        item = PantryItem.includes(:claims).find(params[:id])
        authorize! :read, item
        render json: item.as_json({include: [{user: {only:[:id, :first_name]}},{claims: {include: {user:{only:[:id, :first_name]}}}}]}), status: :ok
    end
    private
    def find_resource
        PantryItem.find(params[:id])
    end
    def associated_resources
        PantryItem.where(user_id: params[:user_id])
    end
    def nested_response(items)
        items.as_json({include:{claims:{include:{user:{only:[:id,:first_name]}}}}})
    end
    def new_resource
        attributes = resource_params
        attributes = attributes.merge(user_id: params[:user_id])
        PantryItem.new(attributes)

        
    end
    def resource_params
        params.require(:pantry_item).permit(:name, :quantity, :unit)
        
    end
end
