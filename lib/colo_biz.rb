module ColoBiz
  require 'faraday'
  require 'core_ext/nil' #give path in gemspec
  require 'colo_biz/query_method' #load children first
  require 'colo_biz/biz_entity'
  require 'colo_biz/data_fetcher'
end
