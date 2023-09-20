require "rails_helper"

describe CardService do
  # Tests the instance methods of the CardService class
  context "instance methods", :vcr do
    # This tests the get_exact_card method
    it "can get a specific card with the proper id" do
      # Creates a new instance of the CardService class
      json_body = CardService.new.get_exact_card("2818f287-8403-5217-9a59-c11af2ab77e1")
      
      # Tests to make sure the response is a hash and has the proper keys and values
      expect(json_body).to be_a(Hash)
      expect(json_body).to have_key(:cards)
      expect(json_body[:cards]).to be_an(Array)
      expect(json_body[:cards].size).to eq(1)
      expect(json_body[:cards][0]).to have_key(:name)
      expect(json_body[:cards][0]).to have_key(:manaCost)
      expect(json_body[:cards][0][:name]).to eq("Avacyn, Angel of Hope")
      expect(json_body[:cards][0][:manaCost]).to eq("{5}{W}{W}{W}")
      expect(json_body[:cards][0][:cmc]).to eq(8.0)
      expect(json_body[:cards][0]).to have_key(:rulings)
      expect(json_body[:cards][0][:rulings]).to be_an(Array)
      expect(json_body[:cards][0][:rulings].size).to eq(2)
    end

    it "can get a specific card with the proper name" do
      json_body = CardService.new.get_cards_by_name("Avacyn, Angel of Hope")

      expect(json_body).to be_a(Hash)
      expect(json_body).to have_key(:cards)
      expect(json_body[:cards]).to be_an(Array)
      expect(json_body[:cards].size).to eq(11)
      expect(json_body[:cards][0]).to have_key(:name)
      expect(json_body[:cards][1]).to have_key(:manaCost)
      expect(json_body[:cards][2][:name]).to eq("Avacyn, Angel of Hope")
      expect(json_body[:cards][3][:manaCost]).to eq("{5}{W}{W}{W}")
      expect(json_body[:cards][4][:cmc]).to eq(8.0)
      expect(json_body[:cards][5]).to have_key(:rulings)
      expect(json_body[:cards][6][:rulings]).to be_an(Array)
      expect(json_body[:cards][7][:rulings].size).to eq(2)
    end
  end
end