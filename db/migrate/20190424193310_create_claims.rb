class CreateClaims < ActiveRecord::Migration[5.2]
  def change
    create_table :claims do |t|
      t.integer :user_id
      t.integer :pantry_item_id
      t.integer :quantity
      t.boolean :aproved, defualt: false

      t.timestamps
    end
  end
end
