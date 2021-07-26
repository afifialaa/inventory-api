class ProductsController < ApplicationController


  skip_before_action :verify_authenticity_token

    def index
        @products = Product.all
        render(json: {products: @products}, status: :ok)
    end

    def show
        @product = Product.find_by_id(params[:id])
        if !@product
            render(json: {message: "Product was not found"}, status: :not_found)
        elsif
            render(json: {product: @product}, status: :ok)
        end
    end

    def create
        @product = Product.new(product_params)
        if @product.save
            render(json: { message: "Product was created successfully"}, status: :created)
        else
            render(json: { message: "Product was not created"}, status: :unprocessable_entity)
        end
    end

    def destroy
        @product = Product.find_by_id(params[:id])
        if !@product
            render(json: {message: "Product was not found"}, status: :not_found)
        elsif @product.destroy
            render(json: {message: "Product was deleted successfully"}, status: :ok)
        end
    end
  
    def update
        @product = Product.find_by_id(params[:id])
        if !@product
            render(json: {message: "Product was not found"}, status: :not_found)
        elsif @product.update(product_params)
            render(json: {message: "Product was updated successfully"}, status: :ok)
        else
            render(json: {message: "Product was not deleted"}, status: :ok)
        end
    end

    private
    def product_params
        params.permit(:name, :description, :quantity, :price, :status, :supplier_id)
    end
end
