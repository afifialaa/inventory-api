class ApplicationController < ActionController::Base

    private

    def get_employee
      @employee = Employee.find_by(id: params[:id])
      if @employee == nil 
        render(json: {error: "emplyee not found"}, status: :not_found)
            return
        end
    end

	def get_user
		@user = User.find_by(email: params[:email])
		if @user == nil
			render(json: {"message": "User not found"}, status: :not_found)
		end
	end

    def get_supplier
		@supplier = Supplier.find_by(id: params[:id])
		if @supplier == nil
			render(json: {error: "Supplier not found"}, status: :not_found)
		end
    end

    def get_warehouse
        @warehouse = Warehouse.find_by_id(params[:id])
        if @supplier == nil
            return render(json: {error: "Warehouse not found"}, status: :not_found)
        end
    end

    def get_customer
        @customer = Customer.find_by_id(params[:id])
        if @customer == nil
            render(json: {error: "Customer not found"}, status: :not_found)
        end
    end

    def get_order
        @order = Order.find_by_id(params[:id])
        if @order == nil
          render(json: {error: "Order not found"}, status: 404)
        end
    end

    def get_prod_ware
        @prod_ware = ProductWarehouse.find_by(product_id: params[:product_id], warehouse_id: params[:warehouse_id])
        if @prod_ware == nil
            render(json: {error: "Record was not found"})
        end
    end

end
