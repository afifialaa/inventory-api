class Api::V1::CustomersController < ApplicationController

    skip_before_action :verify_authenticity_token

    before_action :get_customer, only: [:show, :destroy, :update]

    # Returns all customers
    def index
        @customers = Customer.all
        render(json: @customers, status: 200)
    end

    # Returns a specific customer
	def show
		@customer = Customer.find_by_id(params[:id])
		if !@customer
			render(json: {message: "Customer was not found"}, status: 404)
		else
			render(json: @customer, status: 200)
		end
	end

    def update
        if @customer.update(customer_params)
            render(json: @customer, status: 201)
        end
    end

	# Creates a new customer
	def create
		@customer = Customer.new(customer_params)
		if @customer.save
			render(json: { message: "Customer was created successfully"}, status: 201)
		else
			render(json: { error: @customer.errors}, status: 422)
		end
	end

	# Deletes a customer by id
	def destroy
        if @customer.destroy
            render(json: {message: "Customer was deleted successfully"}, status: 200)
        else
            render(json: {error: @customer.errors}, status: 500)
        end
	end

	private
	def customer_params
		params.permit(:email)
	end

end
