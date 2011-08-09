# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "will_paginate_renderers/version"

Gem::Specification.new do |s|
  s.name        = "will_paginate_renderers"
  s.version     = WillPaginateRenderers::VERSION
  s.platform    = Gem::Platform::RUBY
  s.authors     = ['Robert Speicher']
  s.email       = ['rspeicher@gmail.com']
  s.homepage    = "http://rubygems.org/gems/will_paginate_renderers"
  s.summary     = %q{A collection of renderers for use with will_paginate}
  s.description = %q{A collection of renderers for use with will_paginate.}

  s.rubyforge_project = "will_paginate_renderers"

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]

  s.add_dependency "will_paginate", "~> 3.0"
  s.add_development_dependency "mocha", "~> 0.9"
  s.add_development_dependency "rspec", "~> 2.6"
  s.add_development_dependency "yard"
end
