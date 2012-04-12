
require_relative '../session/lib/magnets-session.rb'

module ::Magnets
end

basepath = 'magnets/Magnets'

files = [
  'Configuration'
]

files.each do |this_file|
  require_relative( File.join( basepath, this_file ) + '.rb' )
end

require_relative( basepath + '.rb' )
