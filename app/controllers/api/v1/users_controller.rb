module Api::V1
    class UsersController < ApplicationController
        # skip CRSF token authentication
        skip_before_action :verify_authenticity_token

        before_action :get_user, only: [:show, :destroy]
        

        def create
            @user = User.new(user_params)

            if @user.save
                render(json: { message: "User created successfully" }, status: 201)
            else
                render(json: { message: @user.errors.messages[:email]}, status: 422)
            end
        end

        def destroy
            if @user.destroy
                render(json: { message: "User was deleted" }, status: 200)
            else
                render(json: { message: "User was not deleted" }, status: :unprocessable_entity)
            end
        end

        def show
            if @user && @user.authenticate(params[:password]) 
                render(json: @user, status: 200)
            else
                render(json: { message: "Wrong password" }, status: 401)
            end
        end

        private
        def user_params
            # params.require(:user).permit( :email, :password)
            params.permit( :email, :password)
        end
    end
end
#curl -X POST http://localhost:8080/api/v1/user/signup -H 'Content-Type: application/json' -d '{"user": {"email":"test@email.com", "password":"test123"}}'
#curl -X POST http://localhost:8080/api/v1/user/login -H 'Content-Type: application/json' -d '{"email":"samsung@gmail.com", "password":"samsung123"}'