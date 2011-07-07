# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "h5_uploader/version"

Gem::Specification.new do |s|
  s.name        = "h5_uploader"
  s.version     = Uploader::VERSION
  s.authors     = ["Andrea Campolonghi"]
  s.email       = ["andrea.campolonghi@fractalgarden.com"]
  s.homepage    = ""
  s.summary     = "Multiple file uploads usign html5 techniques"
  s.description = "Gem add a form builder called uploader that shows a button for multiple file uploads usign html5 techniques"

  s.rubyforge_project = "h5_uploader"

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]
  
  s.add_dependency 'rack-raw-upload'
  s.add_dependency 'actionpack'
end
