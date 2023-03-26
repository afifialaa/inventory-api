module Api::V1
    class SuppliersController < ApplicationController

        # skip CRSF token authentication
        skip_before_action :verify_authenticity_token

        before_action :get_supplier, only: [:show, :destroy, :update]

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
                render(json: { message: "Supplier was not created", errors: @supplier.errors}, status: :unprocessable_entity)
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
            @supplier = Supplier.find_by_id(params[:id])
            if @supplier == nil
                render(json: { error: "Supplier not found"}, status: :not_found)
            elsif @supplier.update(supplier_params)
                render(json: { supplier: @supplier}, status: :ok)
            else
                render(json: { error: @supplier.errors}, status: 500)
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
