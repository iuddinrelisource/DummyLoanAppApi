class CreateUsers < ActiveRecord::Migration[7.0]
  def change
    create_table :users do |t|
      t.string :name
      t.string :email
      t.integer :role
      t.string :phone
      t.boolean :status
      t.date :dob

      t.timestamps
    end
  end
end
