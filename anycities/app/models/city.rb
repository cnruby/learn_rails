class City < ActiveRecord::Base
  attr_accessible :name, :zip_code

  # def fetch_name
  #   url = "http://ws.geonames.org/postalCodeLookupJSON?postalcode=#{zip_code}&country=DE"
  #   json = Net::HTTP.get_response(URI.parse(url)).body
  #   update_attribute(:name, JSON.parse(json)["postalcodes"].first["placeName"])
  # end
end
