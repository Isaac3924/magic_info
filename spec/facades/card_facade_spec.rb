require "rails_helper"

RSpec.describe CardFacade do
  # Creates a new facade instance for each test
  before :each do
    @test_facade0 = CardFacade.new(id: "2818f287-8403-5217-9a59-c11af2ab77e1", card_name: "Avacyn, Angel of Hope")
    @test_facade1 = CardFacade.new(id: "2818f287-8403-5217-9a59-c11af2ab77e1")
    @test_facade2 = CardFacade.new(card_name: "Avacyn, Angel of Hope")
    @test_facade3 = CardFacade.new()
  end

  describe "instance methods" do
    it "can get the singular card if it has the id", :vcr do
      expect(@test_facade0.card_search).to be_a(Hash)
      expect(@test_facade0.card_search).to have_key(:cards)
      expect(@test_facade0.card_search[:cards]).to be_an(Array)
      expect(@test_facade0.card_search[:cards].size).to eq(1)
      expect(@test_facade0.card_search[:cards][0]).to have_key(:name)
      expect(@test_facade0.card_search[:cards][0][:name]).to eq("Avacyn, Angel of Hope")
    end

    it "can get multiple cards with the name", :vcr do
      expect(@test_facade2.card_search).to be_an(Array)
      expect(@test_facade2.card_search.size).to eq(11)
      expect(@test_facade2.card_search).to all(have_key(:name))
      expect(@test_facade2.card_search[0][:name]).to eq("Avacyn, Angel of Hope")
    end
  end
end