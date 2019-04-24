require 'rails_helper'

RSpec.describe Neighborhood, type: :model do
  context "Neighborhoods have associated models"
  hood1 =  Neighborhood.create!(latitude: "34.00", longitude: "-84.00", name: "Test Hood")
  user = User.create!(
    first_name:"Test2", 
    last_name:"Test2", 
    password:"test", 
    :address_attributes=>{
      street:"Test",
      city:"Atlanta",
      state:"GA",
      zip: "33333"})
  it "can associate a user through relationships" do 
    hood1.users << user
    hood1.users << user

    expect(hood1.users.count).to eq(2)
  end

  it "will delete the neighboor record when a hood is deleted" do 
    hood1.users << user
    hood1.users << user
    expect(user.neighbors.count).to eq(2)
    hood1.destroy()
    expect(user.neighbors.count).to eq(0)
  end
  
  
end
