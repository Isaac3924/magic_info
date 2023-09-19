class CardFacade
  attr_reader :card_name

  # Will initialize with a card name
  def initialize(card_name)
    @card_name = card_name
  end

  # This method will return a hash of cards that match the card name
  def card_name_search
    cards = service.get_cards_by_name(@card_name)
  end

  # This method will first check to see if there is only one card that matches the card name. If there is only one card,
  # it will return that card. If there is more than one card, it will send that hash of cards to another method.
  def card_name_results
    results = card_name_search[:cards]

    if results.size == 1
      return results.first
    elsif results.size > 1
      set_names = retrieve_set_name(results)
    else
      return nil
    end
  end

  def retrieve_set_names(cards)
    cards.map do |card|
      card[:set]
    end.uniq
  end

  private
  def service
    @service ||= CardService.new
  end
end