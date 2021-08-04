class UsersController < ApplicationController
    # skip CRSF token authentication
    skip_before_action :verify_authenticity_token

    def create
        @user = User.new(user_params)

        if @user.save
            render(json: { message: "User created successfully" }, status: :created)
        else
            render(json: { message: "Failed to create user" }, status: :unprocessable_entity)
        end
    end

    def destroy
        @user = User.find_by(email: params[:email])

        if !@user 
            render(json: { message: "User was not found " }, status: :not_found)
        elsif @user.destroy
            render(json: { message: "User was deleted" }, status: :ok)
        else
            render(json: { message: "User was not deleted" }, status: :unprocessable_entity)
        end
    end

    def show
        @user = User.find_by(email: params[:email])
        if !@user
            render(json: { message: "User was not found " }, status: :not_found)
        else
            render(json: {user: @user}, status: :ok)
        end
    end

    private
    def user_params
        params.permit(:email, :password)
    end
end
