class CreateBikeLeaseApplications < ActiveRecord::Migration[7.0]
  def change
    create_table :bike_lease_applications do |t|
      t.integer :make_id
      t.integer :model_id
      t.integer :year
      t.string :mileage
      t.integer :lessee_id
      t.integer :colessee_id
      t.float :downpayment
      t.string :status

      t.timestamps
    end
  end
end
