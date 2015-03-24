require_relative "data_fetcher"

module QueryMethod

  #The query does not search 'fuzzy' and needs the entire entity name
  def search_by_entity_name(entity_name)
    response = @conn.get do |req|
      req.url "/resource/colorado-business-entities.json?entityname=#{entity_name}"
    end
    parsed = JSON.parse(response.body)
    make_biz_entities(parsed)
  end

  #not tested yet
  def search_by_principal_city(city_name)
    response = @conn.get do |req|
      req.url "/resource/colorado-business-entities.json?principalcity=#{city_name}"
    end
    parsed = JSON.parse(response.body)
    make_biz_entities(parsed)
  end



end
