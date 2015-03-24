require 'faraday'
require 'json'
require_relative 'biz_entity'

class DataFetcher

  def initialize
    @conn = Faraday.new(:url => 'https://data.colorado.gov') do |faraday|
      faraday.request  :url_encoded             # form-encode POST params
      faraday.response :logger                  # log requests to STDOUT
      faraday.adapter  Faraday.default_adapter  # make requests with Net::HTTP
    end
  end

  def biz_entity
     response = @conn.get do |req|
    req.url "/resource/colorado-business-entities.json"
    # req.headers['X-App-Token'] =
    # req.headers['Content-Type'] =
    end
    @parsed = JSON.parse(response.body)
    make_biz_entities(@parsed)
  end

  def make_biz_entities(entities)
    entities.map do |entity|
      BizEntity.new(entity)
    end
  end

end
