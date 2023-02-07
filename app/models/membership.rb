class Membership < ApplicationRecord
    belongs_to :gym
    belongs_to :client
    validates :client_id, uniqueness: {scope: :gym_id}
    validates :charge, :client_id, :gym_id, presence: true
end
