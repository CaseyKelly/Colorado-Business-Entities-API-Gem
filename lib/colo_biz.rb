module ColoBiz
  require 'faraday'
  require 'json'
  require_relative 'core_ext/nil' #give path in gemspec
  require_relative 'colo_biz/query_method' #load children first
  require_relative 'colo_biz/biz_entity'
  require_relative 'colo_biz/data_fetcher'
end
