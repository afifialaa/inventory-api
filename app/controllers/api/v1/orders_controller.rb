class Api::V1::OrdersController < ApplicationController

    skip_before_action :verify_authenticity_token

    # Returns all orders
    def index
        @orders = Order.all
        render(json: @orders, status: 200)
    end

    # Returns a specific order
	def show
		@order = Order.find_by_id(params[:id])
		if !@order
			render(json: {message: "Order was not found"}, status: 404)
		else
			render(json: @order, status: 200)
		end
	end

	# Creates a new order
	def create
		@order = Order.new(order_params)
		if @order == nil 
			render(json: { message: "Order was not found"}, status: 404)
		elsif @order.save
			render(json: { message: "Order was created successfully"}, status: 201)
		else
			render(json: { message: "Order was not created"}, status: 422)
		end
	end

	# Deletes a order by id
	def destroy
		@order = Order.find_by_id(params[:id])
		if !@order
			render(json: {message: "Order was not found"}, status: 404)
		elsif @order.destroy
			render(json: {message: "Order was deleted successfully"}, status: 200)
		end
	end

    # Returns all orders for a specific customer
    def show_customer_orders
        @customer = Customer.find_by_id(params[:customer_id])
		render(json: {message: "Customer was not found"}, status: 404) if !@customer

		@orders = Order.where(customer_id: params[:customer_id])
		render(json: {message: "Customer has no orders"}, status: 404) if !@orders

		render(json: @orders, status: 200)
    end

	private
	def order_params
		params.permit(:customer_id)
	end

end
