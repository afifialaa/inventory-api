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
			render(json: {id: @order.id}, status: 201)
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

	# Add an item to the order
	def add_item
		# Check if order exists
		@order = Order.find_by_id(params[:order_id])

		if !@order
			render(json: {message: "Order was not found"}, status: 404)
			return
		end

		# ************** Should be in model???????
		# Check if item was already added to order
		if self.item_already_added?
			item = OrderDetail.find_by(order_id: params[:order_id], product_id: params[:product_id])
			total = params[:quantity].to_i + item.quantity.to_i
			item.update(quantity: total)
			render(json: {message: "Item quantity was updated"}, status: 404)
			return
		end

		@order_details = OrderDetail.new
		@order_details.order_id = params[:order_id]
		@order_details.product_id = params[:product_id]
		@order_details.quantity = params[:quantity]

		if @order_details.save
			render(json: {message: "Item was added to order"}, status: 404)
		else
			render(json: {message: "Order detail was not added"}, status: 422)
		end

	end

	# Return items in order
	def show_order_details
		@order_details = OrderDetail.where(order_id: params[:order_id])
		render(json: @order_details, status: 200) 
	end

	# Return products in order
	def show_order_products
		@order = Order.find_by(id: params[:order_id])
		render(json: @order.products, status: 200) 
	end

	private
	def item_already_added?
		item = OrderDetail.find_by(order_id: self.params[:order_id], product_id: self.params[:product_id])
		if !item or item == nil
			return false
		else
			return true
		end
	end

	def order_params
		params.permit(:customer_id)
	end

	def order_details_params
		params.permit(:order_id, :product_id, :quantity)
	end

end
