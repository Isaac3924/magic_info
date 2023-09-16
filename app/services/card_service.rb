class CardService
  # The CardService class is used to make requests to the Magic: The Gathering API. It uses the Faraday gem to make the 
  # requests. The Faraday gem is a HTTP client library that provides a common interface over many adapters (such as Net::HTTP).

  # The following method is used to establish a connection to the API, setting the base url and making a new Faraday connection.
  def conn
    Faraday.new(url: 'https://api.magicthegathering.io/v1')
  end

  # The following method is used to make a basic GET request to the API. It uses the conn method to make the request, 
  # passing in the url and query parameters. The response is then parsed into JSON.
  def get_url(url, query = nil)
    response = conn.get(url, query)
    JSON.parse(response.body, symbolize_names: true)
  end

  # The following method is used to make a specific GET request to the API for a specific card. It uses the get_url 
  # method to make the request, passing in the query parameter of 'id'.
  def get_exact_card(id)
    get_url("cards?", {multiverseid: id})
  end
end