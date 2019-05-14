$:.push File.expand_path('../lib', __FILE__)

require 'caliper/version'

Gem::Specification.new do |g|
  g.name        = 'ims_caliper'
  g.version     = Caliper::VERSION
  g.authors     = ['Matthew Hogan', 'Paul Kerschen', 'Prashant Nayak', 'Zhen Qian', 'Anthony Whyte']
  g.email       = ['lmattson@imsglobal.org']
  g.homepage    = 'https://github.com/IMSGlobal/caliper-ruby'
  g.summary     = 'Caliper Sensor API'
  g.description = 'Ruby implementation of the IMS Caliper Sensor.'
  g.license     = 'LGPL-3.0'

  #g.files = Dir['{app,config,db,lib}/**/*', 'Rakefile']
  g.files     = `git ls-files`.split($\)
  g.executables   = g.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  g.test_files    = g.files.grep(%r{^(test|spec|features)/})
  g.require_path = 'lib'

  g.add_dependency 'require_all'
  g.add_dependency 'concurrent-ruby'
  g.add_dependency 'i18n'
  g.add_dependency 'uuid'
  g.add_dependency 'rest-client', '~> 1.7.3'
end
