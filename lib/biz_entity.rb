require_relative 'data_fetcher'

class BizEntity

  attr_reader :entity_name, :human_address, :longitude, :latitude, :entity_status,
  :entity_form_date, :principal_address, :principal_city, :principal_state,
  :principal_zipcode, :principal_country, :entity_type, :entity_type_verbatim,
  :entity_id, :agent_first_name, :agent_middle_name, :agent_last_name,
  :agent_address, :agent_city, :agent_state, :agent_zipcode,
  :agent_principal_country, :mailing_zipcode, :mailing_country

  def initialize(entity_hash)
      @entity_name = entity_hash['entityname']
      @human_address = JSON.parse(entity_hash['location']['human_address'])
      @longitude = entity_hash['location']['longitude']
      @latitude = entity_hash['location']['latitude']
      @entity_status = entity_hash['entitystatus']
      @entity_form_date = entity_hash['entityformdate'] #make this a date class
      @principal_address = entity_hash['principaladdress']
      @principal_city = entity_hash['principalcity']
      @principal_state = entity_hash['principalstate']
      @principal_zipcode = entity_hash['principalzipcode']
      @principal_country = entity_hash['principalcountry']
      @entity_type = entity_hash['entitytype']
      @entity_type_verbatim = entity_hash['entitytypeverbatim']
      @entity_id = entity_hash['entityid'].to_i
      @agent_first_name = entity_hash['agentfirstname']
      @agent_middle_name = entity_hash['agentmiddlename']
      @agent_last_name = entity_hash['agentlastname']
      @agent_address = entity_hash['agentaddress']
      @agent_city = entity_hash['agentcity']
      @agent_state = entity_hash['agentstate']
      @agent_zipcode = entity_hash['agentzipcode']
      @agent_principal_country = entity_hash['agentprincipalcountry']
      @mailing_zipcode = entity_hash['mailingzipcode']
      @mailing_country = entity_hash['mailingcountry']
  end

  def mailing_address_string
    "#{@human_address['address']}, #{@human_address['city']}, #{@human_address['state']}, #{@human_address['zip']}"
  end

end
