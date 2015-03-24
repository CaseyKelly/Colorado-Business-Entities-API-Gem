require_relative 'data_fetcher'
class BizEntity

  attr_reader :name

  def initialize(entity_hash)
    @name = entity_hash[:name]
  end
end
