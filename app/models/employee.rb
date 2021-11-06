class Employee < ApplicationRecord
	belongs_to :warehouse

	validates :email, presence: true, uniqness: {message: "Email is already taken by an employee"}
	validates :first_name, presence: true
	validates :last_name, presence: true
	validates :position, presence: true
	validates :warehouse_id, presence: true
end
