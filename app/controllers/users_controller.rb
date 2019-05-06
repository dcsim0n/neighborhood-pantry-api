class UsersController < ApplicationController

    def show
        @user = User.find(params[:id])
        user_info = @user.as_json(only: [:id, :email, :first_name, :last_name])
        render json: user_info, status: :ok
    end
    def create
        @user = User.new(user_params)
        if(@user.valid?)
            @user.save
            token = user_token(@user)
            user_info = @user.as_json(only: [:id, :email, :first_name, :last_name])
            render json: {token: token, user: user_info}, status: :ok
        else
            render json: {errors: @user.errors.full_messages}, status: :unprocessable_entity
        end
    end

    def login

        @user = User.find_by(email: params[:email])
        
        if @user && @user.authenticate(params[:password])
            token = user_token(@user)
            user_info = @user.as_json(only: [:id, :email, :first_name, :last_name])
            render json: {token: token, user: user_info }, status: :ok
        else
            render json: {errors: ["Invalid email or password"]}, status: :unauthorized
        end
    end

    private
    def user_params
        params.permit(
            :first_name,
            :last_name,
            :password,
            :email,
            address_attributes:[
                :street,
                :city,
                :state,
                :zip
            ]
        )

    end
    def user_token(user)
        secret = Rails.application.credentials.jwt_secret
        payload = {id: @user.id}
        JWT.encode(payload, secret, 'HS512')
    end

end
