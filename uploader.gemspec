# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "uploader/version"

Gem::Specification.new do |s|
  s.name        = "uploader"
  s.version     = Uploader::VERSION
  s.authors     = ["Andrea Campolonghi"]
  s.email       = ["andrea.campolonghi@fractalgarden.com"]
  s.homepage    = ""
  s.summary     = %q{TODO: Write a gem summary}
  s.description = %q{TODO: Write a gem description}

  s.rubyforge_project = "uploader"

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]
  
  s.add_dependency 'rack-raw-upload'
end
