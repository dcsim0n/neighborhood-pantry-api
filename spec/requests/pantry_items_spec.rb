require 'rails_helper'

RSpec.describe "Pantry items", type: :request do
  describe "GET /pantry items" do
    address = {street: "", city: "", state: "", zip:""}
    let(:user) {User.create!(first_name: "test", last_name:"test", email: "test@test.com", password:"test", address_attributes: address) }
    let(:user2) {User.create!(first_name: "test2", last_name:"test2", email: "test2@test.com", password:"test", address_attributes: address) }
    let(:token) {JWT.encode({id: user.id}, Rails.application.credentials.jwt_secret, 'HS512') }
    let(:token2) {JWT.encode({id: user2.id}, Rails.application.credentials.jwt_secret, 'HS512') }
     
    let(:item) { {name:"Froot by the foot", quantity:10, unit:"roll"}}

    it "can't get an index of all pantry items" do
      
      expect{get "/pantry_items"}.to raise_error ActionController::RoutingError
    end

    it "requries a token to create a pantry item" do 
      expect {post "/users/#{user2.id}/pantry_items", params: {token: token, pantry_item: item }}.to raise_error CanCan::AccessDenied
      
      
    end
    it "creates a pantry item when the token and id match" do 
      post "/users/#{user.id}/pantry_items", params: {token: token, pantry_item: item }
      expect(response).to have_http_status(200)
      expect(user.pantry_items.length).to eq(1)
    end
  end

  describe "Can delete pantry items" do 
    address = {street: "", city: "", state: "", zip:""}
    let(:user) {User.create!(first_name: "test", last_name:"test", email: "test@test.com", password:"test", address_attributes: address) }
    let(:user2) {User.create!(first_name: "test2", last_name:"test2", email: "test2@test.com", password:"test", address_attributes: address) }
    let(:token) {JWT.encode({id: user.id}, Rails.application.credentials.jwt_secret, 'HS512') }
    let(:token2) {JWT.encode({id: user2.id}, Rails.application.credentials.jwt_secret, 'HS512') }
    let(:item) { {name:"Froot by the foot", quantity:10, unit:"roll"}}

    
    
    it "prevents deleting another users items" do 
      item_id = user2.pantry_items.create(item).id
      expect {delete "/pantry_items/#{item_id}", params:{token: token}}.to raise_error CanCan::AccessDenied
    end

    it "deletes a pantry item when the user is authorized"do 
      item_id = user2.pantry_items.create(item).id
      
      delete "/pantry_items/#{item_id}", params:{token: token2}
      expect(user2.reload.pantry_items.count).to eq(0)
    end
    
  end
  
end
