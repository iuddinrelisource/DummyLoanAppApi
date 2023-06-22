class CreateColesses < ActiveRecord::Migration[7.0]
  def change
    create_table :colesses do |t|
      t.string :name
      t.string :address
      t.string :phone
      t.integer :monthly_income
      t.date :dob

      t.timestamps
    end
  end
end
