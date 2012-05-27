
require 'cascading-configuration-array-sorted-unique'

require_relative '../../configuration/lib/magnets-configuration.rb'
require_relative '../../path/lib/magnets-path.rb'

module ::Magnets
  class Request
    module RackApplication
    end
    module Interface
    end
    module Match
      module Host
      end
      module IP
      end
      module Method
      end
      module Port
      end
      module Referer
      end
      module URISchema
      end
      module UserAgent
      end
    end
  end
end

basepath = 'magnets-request/Magnets/Request'

files = [
  'Configuration',
  'RackApplication',
  'Interface',
  'Match/Host',
  'Match/IP',
  'Match/Method',
  'Match/Port',
  'Match/Referer',
  'Match/URISchema',
  'Match/UserAgent'
]

files.each do |this_file|
  require_relative( File.join( basepath, this_file ) + '.rb' )
end

require_relative( basepath + '.rb' )

::Magnets.extend( ::Magnets::Request::RackApplication )  

::Magnets::Configuration.register_configuration( :request, ::Magnets::Request::Configuration )
