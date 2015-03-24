require_relative 'data_fetcher'

class BizEntity

  attr_reader :location

  def initialize(entity_hash)
    unless entity_hash['location'].nil?
      @location = JSON.parse(entity_hash['location']['human_address'])
      #This parses the location out of JSON, I'm not sure why it the overall parser in data_fetcher.rb is not working
    end
  end

  def mailing_address
    "#{@location['address']}, #{@location['city']}, #{@location['state']}, #{@location['zip']}"
  end

end
