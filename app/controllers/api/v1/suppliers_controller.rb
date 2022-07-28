module Api::V1
    class SuppliersController < ApplicationController

        # skip CRSF token authentication
        skip_before_action :verify_authenticity_token

        before_action :set_user, only: [:show, :destroy, :update]

        ##
        # Returns all suppliers
        def index
            @suppliers = Supplier.all
            render(json: {suppliers: @suppliers}, status: :ok)
        end

        ##
        # Finds a supplier by id
        def show
        	render(json: {supplier: @supplier}, status: :ok)
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
           	if @supplier.destroy
                render(json: { message: "Supplier was deleted"}, status: :ok)
            end
        end

        ##
        # Updates a supplier
        def update
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
