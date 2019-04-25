require 'rails_helper'

RSpec.describe "Users controllers", type: :request do
  describe "GET /users controllers" do
    it "nested resources can be created and returned" do
      address = {street: "", city: "", state: "", zip:""}
      user = User.create!(first_name: "test", last_name:"test", email: "test@test.com", password:"test", address_attributes: address)
      
      it "can create a pantry_item as a nested resource"do 
        item = {name:"Froot by the foot", quantity:10, units:"roll"}
        body = {token: }

      end
      

      user.destroy
    end
  end
end
