class BikeLeaseApplication < ApplicationRecord
    belongs_to :make
    belongs_to :model
    belongs_to :lessee, optional: true
    belongs_to :colessee, class_name: 'Colesse',optional: true
end
