require 'rails_helper'

RSpec.describe Deck, type: :model do
  describe 'validations' do
    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:user_id) }
  end

  describe 'relationships' do
    it { should belongs_to(:user) }
  end
end