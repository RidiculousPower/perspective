
require 'cascading-configuration-setting'
require 'cascading-configuration-array-sorted-unique'

require_relative '../../path/lib/magnets-path.rb'

module ::Magnets
  class PathMap
    module Interface
    end
  end
end

basepath = 'magnets-pathmap/Magnets/PathMap'

require_relative( basepath + '/Interface.rb' )

require_relative( basepath + '.rb' )

