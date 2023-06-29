class Api::V1::ProductsWarehousesController < ApplicationController

    skip_before_action :verify_authenticity_token

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
    end

    def update
    end

    def delete
    end

    def move
    end


    private
    def prod_ware_params
        params.permit(:product_id, :warehouse_id, :quantity)
    end
end
