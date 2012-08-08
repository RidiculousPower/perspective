
require 'date'

Gem::Specification.new do |spec|

  spec.name                      =  'perspective'
  spec.rubyforge_project         =  'perspective'
  spec.version                   =  '0.0.1.pre'

  spec.summary                   =  "Perspective."
  spec.description               =  "Coming soon."

  spec.authors                   =  [ 'Asher' ]
  spec.email                     =  'asher@ridiculouspower.com'
  spec.homepage                  =  'http://rubygems.org/gems/perspective'

  spec.required_ruby_version     = ">= 1.9.1"

  spec.date                      = Date.today.to_s
  
  spec.files                     = Dir[ '{lib,spec}/**/*',
                                        'README*', 
                                        'LICENSE*',
                                        'CHANGELOG*' ]

end
