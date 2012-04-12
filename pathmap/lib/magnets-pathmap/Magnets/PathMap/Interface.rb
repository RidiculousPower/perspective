
module ::Magnets::PathMap::Interface
  
  include ::CascadingConfiguration::Array::Sorted::Unique
    
  ################
  #  initialize  #
  ################
  
  def initialize( name, *paths_and_or_parts )
    
    @name = name
    
    @view_paths = { }
		@view_stack = [ ]
		
    paths.concat( paths_and_or_parts )
    
  end

  ###########
  #  paths  #
  ###########
  
  attr_configuration_sorted_unique_array  :paths do
    
    #=======#
    #  []=  #
    #=======#
    
    def []=( index, *paths_and_or_parts )
      
      paths = ::Magnets::Path::Parser.regularize_path_or_parts( *paths_and_or_parts )
      
      # if the index already exists, replace it with the first element and insert the rest after
      if index < count
        
        first_item = paths.shift
        
        super( index, first_item )
        
        insert( index + 1, *paths )

        # add it back on so we can return paths as added
        paths.unshift( first_item )
        
      # otherwise, insert them all
      else

        insert( index, paths )
      
      end
    
      return paths
      
    end
    
    #==========#
    #  insert  #
    #==========#
    
    def insert( index, *paths_and_or_parts )
      
      super( index, *::Magnets::Path::Parser.regularize_path_or_parts( *paths_and_or_parts ) )
      
    end

    #========#
    #  push  #
    #========#

    def push( *paths_and_or_parts )

      super( *::Magnets::Path::Parser.regularize_path_or_parts( *paths_and_or_parts ) )

    end

    #==========#
    #  concat  #
    #==========#

    def concat( *paths_and_or_parts )

      super( *::Magnets::Path::Parser.regularize_path_or_parts( *paths_and_or_parts ) )

    end
    
    #===========#
    #  unshift  #
    #===========#
    
    def unshift( *paths_and_or_parts )
      
      super( *::Magnets::Path::Parser.regularize_path_or_parts( paths_and_or_parts ) )
      
    end
    
  end
  
  ###################
  #  construct_url  #
  ###################
  
  def construct_url( *named_parts )
    
    
    
  end

	attr_accessor	:view_container
	attr_reader   :view_stack, :view_paths

	#########
	#  map  #
	#########
	
	def map( view_path_name )
		
		# create a pathmap
		
		view_path = ::Magnets::Path.new( view_path_name )
		@view_paths[ view_path_name ] = view_path
		@view_stack.push( view_path )
		
		return view_path
		
	end

	##########
	#  view  #
	##########
	
	def view( view_class, & configuration_proc )
		
		# create a view that always renders
		
		view_path = ::Magnets::Path.new.path( '*' ).view( view_class, & configuration_proc )
		@view_stack.push( view_path )
		
		return view_path
		
	end

	###############
	#  view_path  #
	###############
	
	def view_path( view_path_name )
	  
		return @view_paths[ view_path_name ]
	
	end
  
end
