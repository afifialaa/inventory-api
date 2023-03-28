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

    def get_customer
        @customer = Customer.find_by_id(params[:id])
        if @customer == nil
            render(json: {error: "Customer not found"}, status: :not_found)
        end
    end

end
