class PantryItemsController < UserResourcesController


    private
    def find_resource
        PantryItem.find(params[:id])
    end
    def associated_resources
        PantryItem.where(user_id: params[:user_id])
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
