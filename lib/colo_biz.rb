module ColoBiz
  require 'faraday'
  require_relative 'core_ext/nil' #give path in gemspec
  require_relative 'lib/colo_biz/query_method' #load children first
  require_relative 'lib/colo_biz/biz_entity'
  require_relative 'lib/colo_biz/data_fetcher'
end
