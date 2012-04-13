
require_relative '../configuration/lib/magnets-configuration.rb'

require_relative '../request/lib/magnets-request.rb'
require_relative '../session/lib/magnets-session.rb'

require_relative '../view-model/lib/magnets-view-model.rb'

require_relative '../html/lib/magnets-html.rb'

module ::Magnets
end

basepath = 'magnets/Magnets'

files = [
  'Rack'
]

files.each do |this_file|
  require_relative( File.join( basepath, this_file ) + '.rb' )
end

require_relative( basepath + '.rb' )
