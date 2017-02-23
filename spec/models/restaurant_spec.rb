require 'rails_helper'


describe Restaurant, type: :model do
  include Helpers
  it 'is not valid with a name of less than three characters' do
    restaurant = Restaurant.new(name: "kf")
    expect(restaurant).to have(1).error_on(:name)
    expect(restaurant).not_to be_valid
  end

  it 'is not valid unless it has a unique name' do
    Restaurant.create(name: 'Zafi')
    restaurant = Restaurant.new(name: 'Zafi')
    expect(restaurant).to have(1).error_on(:name)
  end

  it {should belong_to(:user)}


end
