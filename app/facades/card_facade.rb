class CardFacade
  attr_reader :id, :card_name

  def initialize(id: nil, card_name: nil)
    @id = id
    @card_name = card_name
  end

  # This method will return a hash of a singular card that match the unique card id
  def card_id_search
    card = service.get_exact_card(@id)
  end

  # This method will return a hash of cards that match the card name
  def card_name_search
    cards = service.get_cards_by_name(@card_name)
  end

  # This method can take either a card id or a card name and return a hash of a singular card that match the unique card id 
  # or an array of hashes of cards that match the card name with only the details we want to display or need.
  def card_search
    if @id.nil? && @card_name.nil?
      # raise error
    elsif !@id.nil?
      card = card_id_search
      return card
    elsif !@card_name.nil?
      cards = card_name_search
      return retrieve_details(cards[:cards])
    end
  end

  # This method will take an array of cards and return an array of hashes of the cards with only the details we want to 
  # display or need.
  def retrieve_details(cards)
    cards.map do |card|
      {
        name: card[:name],
        setName: card[:setName],
        artist: card[:artist],
        imageUrl: card[:imageUrl],
        variations: card[:variations],
        id: card[:id]
      }
    end
  end

  private
  def service
    @service ||= CardService.new
  end
end