module Api::V1
    class EmployeesController < ApplicationController

        skip_before_action :verify_authenticity_token

        before_action :get_employee, only: [:show, :destroy]

        # Returns all employees
        def index
            @employees = Employee.all
            render(json: @employees, status: 200)
        end

        # Returns a specific employee
        def show
            render(json: @employee, status: 200)
        end

        # Creates a new employees
        def create
            @employee = Employee.new(employee_params)
            if @employee.save
            	render(json: { message: "Employee was created successfully"}, status: 201)
            else
            	render(json: { message: "Employee was not created", errors: @employee.errors}, status: 422)
            end
        end

        # Deletes an employee by id
        def destroy
            if @employee.destroy
                render(json: {message: "Employee was deleted successfully"}, status: 200)
            end
        end

        # Updates an employee
        def update
            @employee = Employee.find_by_id(params[:id])
            if !@employee
                render(json: {message: "Employee was not found"}, status: 404)
            elsif @employee.update(employee_params)
                render(json: {message: "Employee was updated successfully"}, status: 200)
            else
                render(json: {message: "Employee was not deleted"}, status: :ok)
            end
        end

        # Return count of all employees
        # def count_all
        # 	@count = Employee.all.count
        # 	render(json: {count: @count})
        # end

        private
        def employee_params
            params.permit(:email, :first_name, :last_name, :phone, :position, :warehouse_id)
        end
        
    end

end
