# -*- encoding: utf-8 -*-
lib = File.expand_path('../lib/', __FILE__)
$:.unshift lib unless $:.include?(lib)

Gem::Specification.new do |s|
  s.name        = 'tablr'
  s.version     = '0.1'
  s.summary     = "Tables in your console in Ruby"
  s.description = "Create tables easily with Tablr in your console."
  s.authors     = ["Daniel Durante"]
  s.email       = 'officedebo@gmail.com'
  s.files       = Dir.glob("{lib}/**/*") + %w(CHANGELOG COPYING README.markdown)
  s.require_paths = ["lib"]
  s.homepage    = 'https://github.com/durango/Tablr'

  s.license = 'MIT'
  s.date = Time.now.strftime("%Y-%m-%d")
  s.required_rubygems_version = ">= 1.3.6"
end
