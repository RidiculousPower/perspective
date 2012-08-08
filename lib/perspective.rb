
require 'perspective/configuration'
require 'perspective/request'
require 'perspective/session'
require 'perspective/view/model'
require 'perspective/html/elements'

module ::Perspective
end

basepath = 'perspective/Perspective'

files = [

]

files.each do |this_file|
  require_relative( File.join( basepath, this_file ) + '.rb' )
end

require_relative( basepath + '.rb' )
