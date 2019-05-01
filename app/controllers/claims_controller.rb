class ClaimsController < UserResourcesController
    private
    def find_resource
        Claim.find(params[:id])
    end
    def associated_resources
        Claim.where(user_id: params[:user_id])
    end
    def new_resource
        claim_attributes = resource_params
        claim_attributes = claim_attributes.merge(user_id: params[:user_id])
        Claim.new(claim_attributes)
    end
    def nested_response(claims)
        claims.as_json({include: {user:{only:[:id, :first_name]}}})
    end
    def resource_params
        params.require(:claim).permit(:pantry_item_id, :quantity, :aproved)
    end
end
