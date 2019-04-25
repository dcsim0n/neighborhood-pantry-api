class PantryItemsController < ApplicationController
    def index
        #add authorization here
        items = PantryItem.where(user_id: params[:user_id])
        render json: items, status: :ok
    end
    def create
        user = current_user
        item_attributes = item_params
        #get the user id from the url
        item_attributes = item_attributes.merge(user_id: params[:user_id])
        #add authorization here
        item = PantryItem.new(item_attributes)
        authorize! :create, item
        if item.valid?
            item.save
            render json: user.pantry_items, status: :ok
        else
            render json: {errors: item.erros.full_messages}, status: :unprocessable_entity 
        end
    end

    def destroy
        item = PantryItem.find(params[:id])
        authorize! :delete, item
        item.destroy
        render json: item, status: :ok
    end


    private
    def item_params
        item = params.require(:pantry_item).permit(:name, :quantity, :unit)
        
    end
end
