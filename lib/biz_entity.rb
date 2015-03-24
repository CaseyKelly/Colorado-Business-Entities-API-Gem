require_relative 'data_fetcher'

class BizEntity

  attr_reader :location

  def initialize(entity_hash)
    unless entity_hash['location'].nil?
      @location = entity_hash['location']['human_address']
    end
  end
end
