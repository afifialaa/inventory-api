class CategoriesController < ApplicationController

    skip_before_action :verify_authenticity_token

    def index
        @categories = Category.all
        render(json: {categories: @categories}, status: :ok)
    end

    def show
        @category = Category.find_by_id(params[:id])
        if !@category
            render(json: {message: "Category was not found"}, status: :not_found)
        else
            render(json: {category: @category}, status: :ok)
        end
    end

    def create
        @category = Category.new(category_params)
        if @category.save
            render(json: {message: "Category was created successfully"}, status: :created)
        else
            render(json: {message: "Category was not created"}, status: :unprocessable_entity)
        end
    end

    def update
        @category = Category.find_by_id(params[:id])
        if !@category
            render(json: {message: "Category was not found"}, status: :not_found)
        elsif @category.update(category_params)
            render(json: {message: "Category was updated successfully"}, status: :ok)
        else
            render(json: {message: "Category was not updated"}, status: :unprocessable_entity)
        end
    end

    def destroy
        @category = Category.find_by_id(params[:id])
        if !@category
            render(json:{message: "Category was not found"}, status: :not_found)
        elsif @category.destroy
            render(json:{message: "Category was deleted successfully"}, status: :ok)
        else
            render(json:{message: "Category was not deleted"}, status: :unprocessable_entity)
        end
    end

    private
    def category_params
        params.permit(:name, :description)
    end
end
