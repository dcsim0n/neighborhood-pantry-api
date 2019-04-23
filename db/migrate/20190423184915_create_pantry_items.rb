class CreatePantryItems < ActiveRecord::Migration[5.2]
  def change
    create_table :pantry_items do |t|
      t.integer :user_id
      t.string :name
      t.decimal :price
      t.integer :quantity
      t.string :unit

      t.timestamps
    end
  end
end
