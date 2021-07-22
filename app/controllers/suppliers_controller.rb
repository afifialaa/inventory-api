class SuppliersController < ApplicationController

    # skip CRSF token authentication
    skip_before_action :verify_authenticity_token

    def index
        @suppliers = Supplier.all
        render(json: {suppliers: @suppliers}, status: :ok)
    end

    def show
        @supplier = Supplier.find_by_id(params[:id])
        if !@supplier 
            render(json: {message: "not a variable"}, status: :not_found)
        else
            render(json: {supplier: @supplier}, status: :ok)
        end
    end

    def create
        @supplier = Supplier.new(supplier_params)
        if @supplier.save
            render(json: { message: "Supplier was created successfully"}, status: :created)
        else
            render(json: { message: "Supplier was not created"}, status: :unprocessable_entity)
        end
    end

    def destroy
        @supplier = Supplier.find_by_id(params[:id])
        if !@supplier
            render(json: { message: "Supplier was not found"}, status: :not_found)
        else
            @supplier.destroy
            render(json: { message: "Supplier was deleted successfully"}, status: :ok)
        end
    end

    def update
        @supplier = Supplier.find(params[:id])
        if @supplier.update(supplier_params)
            render(json: { message: "Supplier was updated successfully"}, status: :ok)
        else
            render(json: { message: "Failed to update supplier"}, status: :not_modified)
        end
    end

    private
    def supplier_params
        params.permit(:email, :name, :phone, :address, :field)
    end
end
