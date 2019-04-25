class ApplicationController < ActionController::API
    
    private
    def current_user
        token = params[:token]
        secret = Rails.application.credentials.jwt_secret
        id = JWT.decode(token, secret, true, {algorithm: "HS512"}).first["id"]
        
        user = User.find(id)
    end
end
