module Api::V1
    class ProductsController < ApplicationController
        skip_before_action :verify_authenticity_token

        ##
        # Returns all products
        def index
            @products = Product.all
            render(json: {products: @products}, status: 200)
        end

        def show
            @product = Product.find_by_id(params[:id])
            if !@product
                render(json: {error: "Product was not found"}, status: 404)
            else
                render(json: @product, status: 200)
            end
        end

        ##
        # Creates a new product
        def create
            @product = Product.new(product_params)
            if @product.save
                render(json: { message: "Product was created successfully"}, status: 201)
            else
                render(json: { error: @product.errors}, status: 422)
            end
        end

        ##
        # Deletes a product by id
        def destroy
            @product = Product.find_by_id(params[:id])
            if !@product
                render(json: {error: "Product was not found"}, status: 404)
            elsif @product.destroy
                render(json: {message: "Product was deleted successfully"}, status: 200)
            end
        end
    
        ##
        # Updates a product
        def update
            @product = Product.find_by_id(params[:id])
            if !@product
                render(json: {error: "Product was not found"}, status: 404)
            elsif @product.update(product_params)
                render(json: {product: @product}, status: 200)
            else
                render(json: {error: @product.errors}, status: 200)
            end
        end

        ##
        # Counts all products
        def count_all
            @count = Product.all.count
            render(json: {count: @count})
        end

        private
        def product_params
            params.permit(:name, :description, :quantity, :price, :status, :supplier_id)
        end
    end
end
