

class Warehouse < ApplicationRecord

    # Ensures warehouse is empty before deletion
    before_destroy :empty_warehouse?

    has_and_belongs_to_many :products

    validates :name, presence: true
    validates :email, :uniqueness => {:message => "Email is already taken by a warehouse"}

    # Calculates unoccupied capacity
    def calculate_unoccupied_capacity
        (self.total_capacity - self.occupied_capacity)
    end

    private
    # Checks if warehouse is empty
    def empty_warehouse?
        if occupied_capacity != 0
            self.errors.add(:not_empty, "Cannot delete an occupied warehouse")
            throw :abort
        end
    end

    # Checks utilization capacity againist total capacity
    def check_utilization_capacity
        if self.utilization_capacity >= self.total_capacity
            self.errors.add(:not_empty, "Invalid utilization capacity")
            throw :abort
        end
    end

    # Checks occupied capacity againist utilization capacity
    def check_occupied_capacity
        if self.occupied_capacity > self.utilization_capacity
            self.errors.add(:not_empty, "Invalid occupation capacity")
            thorw :abort
        end
    end

end
