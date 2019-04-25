class UsersController < ApplicationController

    def show
        @user = User.find(params[:id])

        render json: @user, status: :ok
    end


    def login

        @user = User.find_by(email: params[:email])
        
        if @user && @user.authenticate(params[:password])
            secret = Rails.application.credentials.jwt_secret
            payload = {id: @user.id}
            token = JWT.encode(payload, secret, 'HS512')
            user_info = @user.as_json(only: [:id, :email, :first_name, :last_name])
            render json: {token: token, user: user_info }, status: :ok
        else
            render json: {errors: ["Invalid email or password"]}, status: :unauthorized
        end
    end



end
