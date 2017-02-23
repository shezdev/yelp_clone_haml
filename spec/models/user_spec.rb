require 'rails_helper'

describe User, type: :model do
  context 'associations' do
    it { should have_many(:restaurants) }
  end
end
