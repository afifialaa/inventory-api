module Api::V1
    class SuppliersController < ApplicationController

        # skip CRSF token authentication
        skip_before_action :verify_authenticity_token

        ##
        # Returns all suppliers
        def index
            @suppliers = Supplier.all
            render(json: {suppliers: @suppliers}, status: :ok)
        end

        ##
        # Finds a supplier by id
        def show
            @supplier = Supplier.find_by_id(params[:id])
            if !@supplier 
                render(json: {message: "not a variable"}, status: :not_found)
            else
                render(json: {supplier: @supplier}, status: :ok)
            end
        end

        ##
        # Creates a new supplier
        def create
            @supplier = Supplier.new(supplier_params)
            if @supplier.save
                render(json: { message: "Supplier was created successfully"}, status: :created)
            else
                render(json: { message: "Supplier was not created"}, status: :unprocessable_entity)
            end
        end

        ##
        # Deletes a supplier by id
        def destroy
            @supplier = Supplier.find_by_id(params[:id])
            if !@supplier
                render(json: { message: "Supplier was not found"}, status: :not_found)
            else
                @supplier.destroy
                render(json: { message: "Supplier was deleted successfully"}, status: :ok)
            end
        end

        ##
        # Updates a supplier
        def update
            @supplier = Supplier.find(params[:id])
            if @supplier.update(supplier_params)
                render(json: { message: "Supplier was updated successfully"}, status: :ok)
            else
                render(json: { message: "Failed to update supplier"}, status: :not_modified)
            end
        end

        ##
        # Counts products of a certain supplier
        def count_products
            @supplier = Supplier.find(params[:id])
            @count = @supplier.products.count
            render(json: { count: @count}, status: :ok)
        end

        private
        def supplier_params
            params.permit(:email, :name, :phone, :address, :field)
        end
    end
end