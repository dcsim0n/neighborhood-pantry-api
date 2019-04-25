require 'rails_helper'

RSpec.describe "Login route", type: :request do
  describe "POST /login" do
    
    it "returns unauthorized without credentials" do
      post "/login"
      expect(response).to have_http_status(401)
    end

    it "returns authorized with correct credentials" do 
      address = {street: "", city: "", state: "", zip:""}
      user = User.create!(first_name: "test", last_name:"test", email: "test@test.com", password:"test", address_attributes: address)

      headers = {
        "Accept" => "application/json"
      }
      post "/login", params: {:email => user.email, :password=> "test"}, headers: headers
      expect(response).to have_http_status(200)
      expect(response.content_type).to eq("application/json")
      expect(response.body).to include(user.to_json(only: [:id, :email, :first_name, :last_name]))
      
      user.destroy()
    end
    it "returns unathorized with incorect credentials" do 
      address = {street: "", city: "", state: "", zip:""}
      user = User.create!(first_name: "test", last_name:"test", email: "test@test.com", password:"test", address_attributes: address)
 
      headers = {
        "Accept" => "application/json"
      }
      post "/login", params: {:email => user.email, :password=> "no test"}, headers: headers
      expect(response).to have_http_status(401)

      user.destroy
    end
  end
end
