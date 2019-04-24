class CreatePantryRequests < ActiveRecord::Migration[5.2]
  def change
    create_table :pantry_requests do |t|
      t.integer :user_id
      t.string :name
      t.integer :quantity
      t.string :unit

      t.timestamps
    end
  end
end
