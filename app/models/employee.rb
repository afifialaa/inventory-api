class Employee < ApplicationRecord

	validates :email, presence: true, :uniqueness => {:message => "Email is already taken by an employee"}
	validates :first_name, presence: true
	validates :last_name, presence: true
    validates :phone, presence: true, :uniqueness => {:message => "Phone number already exists"}
	validates :position, presence: true

    def self.count_employees
        Rails.cache.fetch(['employee', __method__], expires_in: 2.minutes) do
            Employee.count
        end
    end

    private
    def check_if_manager_exists
        warehouse_id = Employee.where(position: 'manager')
        if new_record.position == 'manager' 
        end
    end
end
