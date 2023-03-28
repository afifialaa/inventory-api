

class Warehouse < ApplicationRecord

    # Ensures warehouse is empty before deletion
    belongs_to :employee
    before_destroy :empty_warehouse?

    validates :name, presence: true
    validates :email, :uniqueness => {:message => "Email is already taken by a warehouse"}
    validates :manager_id, presence: true

    private
    # Checks if warehouse is empty
    def empty_warehouse?
        if occupied_capacity != 0
            self.errors.add(:not_empty, "Cannot delete an occupied warehouse")
            throw :abort
        end
    end

    # Calculates unoccupied capacity
    def calculate_unoccupied_capacity
        (self.total_capacity - self.occupied_capacity)
    end
end
