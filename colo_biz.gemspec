Gem::Specification.new do |s|
  s.name        = 'colo_biz'
  s.version     = '0.0.2' #semver.org
  s.date        = '2015-04-25'
  s.summary     = "Colorado Business Entities Gem"
  s.description = "A gem that turns the CO Business Entity API into ruby methods."
  s.authors     = ["Finnegan Hewitt", "Casey Kelly"]
  s.email       = ['fbhewitt@gmail.com', 'casey.kelly@colorado.edu'] #can this take an array?
  s.files       = `git ls-files -z`.split("\x0")
  s.homepage    = 'https://github.com/CaseyKelly/Colorado-Business-Entities-API-Gem' # need to hoook up to rubygem API http://rubygems.org/gems/
  s.license     = 'MIT'
  s.add_runtime_dependency 'faraday'
  s.add_runtime_dependency 'json'
  s.add_development_dependency "bundler", "~> 1.7"
  s.add_development_dependency "rake", "~> 10.0"
  s.add_development_dependency "rspec"
end
