module Api::V1
    class WarehousesController < ApplicationController

        # skip CRSF token authentication
        skip_before_action :verify_authenticity_token

        ##
        # Returns all warehouses
        def index
            @warehouses = Warehouse.all
            render(json: {warehouses: @warehouses}, status: :ok)
        end

        ##
        # Returns a warehouse
        def show

            @warehouse = Warehouse.find_by_id(params[:id])
            if !@warehouse
                render(json: {message: "Warehouse was not found"}, status: :not_found)
            else
                render(json: {warehouse: @warehouse}, status: :ok)
            end
        end

        ##
        # Creates a new warehouse
        def create
            @warehouse = Warehouse.new(warehouse_params)
            if @warehouse.save
                render(json: {message: "Warehouse was created successfully"}, status: :created)
            else
                render(json: {message: "Failed to create warehouse", errors: @warehouse.errors}, status: :unprocessable_entity)
            end
        end

        ##
        # Deletes a warehouse
        def destroy
            @warehouse = Warehouse.find_by_id(params[:id])
            if @warehouse == nil
                render(json: {error: 'Warehouse not found'}, status: :not_found)
            elsif @warehouse.destroy
                render(json: {message: "Warehouse was deleted"}, message: :ok)
            else
                render(json: {message: @warehouse.errors.messages}, status: :unprocessable_entity)
            end
        end

        ##
        # Updates a warehouse
        def update
            @warehouse = Warehouse.find_by_id(params[:id])
            if !@warehouse
                render(json: {message: "Warehouse was not found"}, status: :not_found)
            elsif @warehouse.update(warehouse_params)
                render(json: {warehouse: @warehouse}, status: :ok)
            end
        end

        private
        def warehouse_params
            params.permit(:name, :address, :phone_number, :email, :manager_id, :total_capacity, :occupied_capacity)
        end

    end
end