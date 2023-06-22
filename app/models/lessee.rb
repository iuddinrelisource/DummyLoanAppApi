class Lessee < ApplicationRecord
    has_one :bike_lease_application
    validates :name, presence: true
end
