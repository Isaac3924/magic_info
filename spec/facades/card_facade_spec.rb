require "rails_helper"

RSpec.describe CardFacade do
  # Creates a new facade instance for each test
  before :each do
    @test_facade = CardFacade.new("Avacyn, Angel of Hope")
  end

  describe "instance methods" do
    it "can get a specific card with the proper name", :vcr do
      expect(@test_facade.card_name_search).to be_a(Hash)
      expect(@test_facade.card_name_search).to have_key(:cards)
      expect(@test_facade.card_name_search[:cards]).to be_an(Array)
      expect(@test_facade.card_name_search[:cards].size).to eq(11)
      expect(@test_facade.card_name_search[:cards][0]).to have_key(:name)
      expect(@test_facade.card_name_search[:cards][1][:name]).to eq("Avacyn, Angel of Hope")
    end
  end
end