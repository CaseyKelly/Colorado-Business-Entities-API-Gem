# require_relative "data_fetcher"

module ColoBiz
  module QueryMethod

  def custom_query(query)
    response = @conn.get do |req|
      req.url "/resource/colorado-business-entities.json?#{query}"
    end
    parsed = JSON.parse(response.body)
    make_biz_entities(parsed)
  end

  #This query searches all names that contain the string entered. e.g. the argument 'mill' will return all the entities with mill in their name.
  def search_by_entity_name(entity_name)
    response = @conn.get do |req|
      req.url "/resource/colorado-business-entities.json?$select=entityname&$q=#{entity_name}"
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

  #not tested yet
  def search_by_principal_state(state_name)
    response = @conn.get do |req|
      req.url "/resource/colorado-business-entities.json?principalstate=#{state_name}"
    end
    parsed = JSON.parse(response.body)
    make_biz_entities(parsed)
  end

  #not tested yet
  def search_by_principal_zipcode(zipcode)
    response = @conn.get do |req|
      req.url "/resource/colorado-business-entities.json?principalzipcode=#{zipcode}"
    end
    parsed = JSON.parse(response.body)
    make_biz_entities(parsed)
  end

  #not tested yet
  def search_by_principal_country(two_letter_country_code)
    response = @conn.get do |req|
      req.url "/resource/colorado-business-entities.json?principalcountry=#{two_letter_country_code}"
    end
    parsed = JSON.parse(response.body)
    make_biz_entities(parsed)
  end

  #mailing address, city, state, zipcode, and country are skipped here

  #not tested yet
  #e.g. "Withdrawn"
  def search_by_entity_status(entity_status)
    response = @conn.get do |req|
      req.url "/resource/colorado-business-entities.json?entitystatus=#{entity_status}"
    end
    parsed = JSON.parse(response.body)
    make_biz_entities(parsed)
  end


  #e.g. "Water Company"
  #not tested
  def search_by_entity_type_verbatum(entity_type_verbatum)
    response = @conn.get do |req|
      req.url "/resource/colorado-business-entities.json?entitytypeverbatum=#{entity_type_verbatum}"
    end
    parsed = JSON.parse(response.body)
    make_biz_entities(parsed)
  end

  #Must be the acronym for the type. e.g. "WC" for water company
  #not tested
  def search_by_entity_type(entity_type)
    response = @conn.get do |req|
      req.url "/resource/colorado-business-entities.json?entitytype=#{entity_type}"
    end
    parsed = JSON.parse(response.body)
    make_biz_entities(parsed)
  end

  #first and last name are not case sensitive
  #not tested
  def search_by_agent_full_name(first_name, last_name)
    response = @conn.get do |req|
      req.url "/resource/colorado-business-entities.json?agentfirstname=#{first_name}&agentlastname=#{last_name}"
    end
    parsed = JSON.parse(response.body)
    make_biz_entities(parsed)
  end

  #skipped agent middle name, agent suffix, agent organization name, agent principle address 1 and 2

  #not tested
  def search_by_agent_principal_city(agent_principal_city)
    response = @conn.get do |req|
      req.url "/resource/colorado-business-entities.json?agentprincipalcity=#{agent_principal_city}"
    end
    parsed = JSON.parse(response.body)
    make_biz_entities(parsed)
  end

  def search_by_agent_principal_state(agent_principal_state)
    response = @conn.get do |req|
      req.url "/resource/colorado-business-entities.json?agentprincipalstate=#{agent_principal_state}"
    end
    parsed = JSON.parse(response.body)
    make_biz_entities(parsed)
  end

  def search_by_agent_principal_zipcode(agent_principal_zipcode)
    response = @conn.get do |req|
      req.url "/resource/colorado-business-entities.json?agentprincipalzipcode=#{agent_principal_zipcode}"
    end
    parsed = JSON.parse(response.body)
    make_biz_entities(parsed)
  end

  def search_by_agent_principal_country(agent_principal_country)
    response = @conn.get do |req|
      req.url "/resource/colorado-business-entities.json?agentprincipalcountry=#{agent_principal_country}"
    end
    parsed = JSON.parse(response.body)
    make_biz_entities(parsed)
  end

  #skipped agent mailing addres 1 and 2

  def search_by_agent_mailing_city(agent_mailing_city)
    response = @conn.get do |req|
      req.url "/resource/colorado-business-entities.json?agentmailingcity=#{agent_mailing_city}"
    end
    parsed = JSON.parse(response.body)
    make_biz_entities(parsed)
  end

  def search_by_agent_mailing_state(agent_mailing_state)
    response = @conn.get do |req|
      req.url "/resource/colorado-business-entities.json?agentmailingstate=#{agent_mailing_state}"
    end
    parsed = JSON.parse(response.body)
    make_biz_entities(parsed)
  end

  def search_by_agent_mailing_zipcode(agent_mailing_zipcode)
    response = @conn.get do |req|
      req.url "/resource/colorado-business-entities.json?agentmailingzipcode=#{agent_mailing_zipcode}"
    end
    parsed = JSON.parse(response.body)
    make_biz_entities(parsed)
  end

  def search_by_agent_mailing_city(agent_mailing_country)
    response = @conn.get do |req|
      req.url "/resource/colorado-business-entities.json?agentmailingcountry=#{agent_mailing_country}"
    end
    parsed = JSON.parse(response.body)
    make_biz_entities(parsed)
  end

  #must be in 'YYYY-MM-DD' format
  def search_for_entity_formations_after(date)
    response = @conn.get do |req|
      req.url "/resource/colorado-business-entities.json?entityformdate > #{date}"
    end
    parsed = JSON.parse(response.body)
    make_biz_entities(parsed)
  end

  #must be in 'YYYY-MM-DD' format
  def search_for_entities_formed_before(date)
    response = @conn.get do |req|
      req.url "/resource/colorado-business-entities.json?entityformdate < #{date}"
    end
    parsed = JSON.parse(response.body)
    make_biz_entities(parsed)
  end

  #radius is measured in miles
  def search_for_entities_(longitude, latitude, radius)
    response = @conn.get do |req|
      req.url "/resource/colorado-business-entities.json?$where=within_circle(location, #{longitude}, #{latitude}, #{radius*1609})"
    end
    parsed = JSON.parse(response.body)
    make_biz_entities(parsed)
  end
  end
end
