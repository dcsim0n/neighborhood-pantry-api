class AddCityToAddress < ActiveRecord::Migration[5.2]
  def change
    add_column :addresses, :city, :string
  end
end
