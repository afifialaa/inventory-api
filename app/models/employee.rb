class Employee < ApplicationRecord
	belongs_to :warehouse

	validates :email, presence: true, :uniqueness => {:message => "Email is already taken by an employee"}
	validates :first_name, presence: true
	validates :last_name, presence: true
    validates :phone, presence: true, :uniqueness => {:message => "Phone number already exists"}
	validates :position, presence: true
    validates :warehouse_id, presence: true

    private
    def check_if_manager_exists
        warehouse_id = Employee.where(position: 'manager')
        if new_record.position == 'manager' 
        end
    end
end
