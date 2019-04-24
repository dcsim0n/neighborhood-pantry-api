require 'rails_helper'

RSpec.describe User, type: :model do
  context "Users have associated models"
  user = User.create!(
    first_name:"Test2", 
    last_name:"Test2", 
    password:"test", 
    :address_attributes=>{
      street:"Test",
      city:"Atlanta",
      state:"GA",
      zip: "33333"})
  user2 = User.create!(
    first_name:"Test2", 
    last_name:"Test2", 
    password:"test", 
    :address_attributes=>{
      street:"Test",
      city:"Atlanta",
      state:"GA",
      zip: "33333"})
    it "asociates neighborhoods with a user" do
      
      hood1 = user.neighborhoods.create!(latitude: "34.00", longitude: "-84.00", name: "Test Hood")
      hood2 = user.neighborhoods.create!(latitude: "33.00", longitude: "-82.00", name: "Test Hood")

      expect(user.neighbors.length).to eq(2)
    end

    it "can create pantry items" do 
      user.pantry_items.create!(
        name:"Fruit by the Foot",
        quantity: 10,
        unit: "rolls" 
      )
      user.pantry_items.create!(
        name:"Fruit by the Foot",
        quantity: 10,
        unit: "rolls" 
      )
      expect(user.pantry_items.length).to eq(2)
    end

    it "can create pantry requests" do 
      user.pantry_requests.create!(
        name:"Fruit by the Foot",
        quantity: 10,
        unit: "rolls" 
      )
      user.pantry_requests.create!(
        name:"Fruit by the Foot",
        quantity: 10,
        unit: "rolls" 
      )
      expect(user.pantry_requests.length).to eq(2)
    end

    it "can create an offer for a pantry request" do
      request = user.pantry_requests.create!(
        name:"Fruit by the Foot",
        quantity: 10,
        unit: "rolls" 
      )
      user2.offers.create!(pantry_request_id: request.id, quantity: 3)
      expect(request.offers.length).to eq(1)
    end

    it "can create a claim for a pantry item" do 
      item = user.pantry_items.create!(
        name:"Fruit by the Foot",
        quantity: 10,
        unit: "rolls" 
      )
      user2.claims.create!(pantry_item_id: item.id, quantity: 3)
      expect(item.claims.length).to eq(1)
    end

    it "destroys the associated neighbor object when a user is deleted" do 
      hood1 = user2.neighborhoods.create!(latitude: "34.00", longitude: "-84.00", name: "Test Hood")
      expect(hood1.neighbors.count).to eq(1)
      user2.destroy()
      expect(hood1.neighbors.count).to eq(0)
    end
end
