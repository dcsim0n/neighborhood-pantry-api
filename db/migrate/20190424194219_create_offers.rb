class CreateOffers < ActiveRecord::Migration[5.2]
  def change
    create_table :offers do |t|
      t.integer :user_id
      t.integer :pantry_request_id
      t.integer :quantity
      t.boolean :accepted, default: false
      t.decimal :price

      t.timestamps
    end
  end
end
