class CreateNeighboors < ActiveRecord::Migration[5.2]
  def change
    create_table :neighbors do |t|
      t.integer :user_id
      t.integer :neighborhood_id

      t.timestamps
    end
  end
end
