class CreateNeighborhoods < ActiveRecord::Migration[5.2]
  def change
    create_table :neighborhoods do |t|
      t.string :name
      t.float :lat
      t.float :long

      t.timestamps
    end
  end
end
