class UserResourcesController < ApplicationController
    def index
        authorize! :read, associated_resources.first
        render json: associated_resources, status: :ok
    end
    def create
        user = current_user
        
        #get the user id from the url
        #add authorization here
        item = new_resource
        authorize! :create, item
        if item.valid?
            item.save
            render json: associated_resources, status: :ok
        else
            render json: {errors: item.errors.full_messages}, status: :unprocessable_entity 
        end
    end

    def destroy
        item = find_resource
        authorize! :delete, item
        item.destroy
        render json: item, status: :ok
    end

end