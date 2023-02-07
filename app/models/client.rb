class Client < ApplicationRecord
    has_many :memberships
    has_many :gyms, through: :memberships
  
    def compute_charges
        allCharges = self.memberships.map do |i| 
            i.charge
        end 
        allCharges.sum
    end
end
