class OffersController < UserResourcesController
    private
    def find_resource
        Offer.find(params[:id])
    end
    def associated_resources
        Offer.where(user_id: params[:user_id])
    end
    def nested_response(offers)
        offers.as_json({include: {user:{only:[:id, :first_name]}}})
    end
    def new_resource
        offer_attributes = resource_params
        offer_attributes = offer_attributes.merge(user_id: params[:user_id])
        Offer.new(offer_attributes)
    end

    def resource_params
        params.require(:offer).permit(:pantry_request_id, :quantity, :accepted)
    end
end
