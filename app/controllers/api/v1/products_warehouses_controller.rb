class Api::V1::ProductsWarehousesController < ApplicationController

    skip_before_action :verify_authenticity_token

    before_action :get_prod_ware, only: [:show, :destroy, :update]

    def index
        @prod_ware = ProductWarehouse.all
        render(json: {items: @prod_ware}, status: 200)
    end

    def create
        @prod_ware = ProductWarehouse.new(prod_ware_params)
        if @prod_ware.save
            return render(json: {message: "Record was created successfully"}, status: 201)
        end
        render(json: {error: @prod_ware.errors}, status: 422)
    end

    def show
        render(json: {prod: @prod_ware}, status: 200)
    end

    def update
        if @prod_ware.update(prod_ware_params)
            render(json: {message: "Record was updated"}, status: 201)
        else
            render(json: {error: "Failed to update record"}, status: 422)
        end
    end

    def destroy
        if @prod_ware.destroy
            render(json: {message: "Recored was deleted successfully"}, status: 200)
        else
            render(json: {error: "Failed to delete record"}, status: 422)
        end

    end

    def move
    end


    private
    def prod_ware_params
        params.permit(:product_id, :warehouse_id, :quantity)
    end
end
