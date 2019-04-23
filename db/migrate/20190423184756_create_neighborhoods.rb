class CreateNeighborhoods < ActiveRecord::Migration[5.2]
  def change
    create_table :neighborhoods do |t|
      t.string :name
      t.double :lat
      t.double :long

      t.timestamps
    end
  end
end
