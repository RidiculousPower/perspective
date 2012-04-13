
module ::Magnets::Rack

  ##########
  #  call  #
  ##########

  def call( environment )
		
		initialize_rack_request
		
		return application.call( environment )
	
	end

	#################
  #  application  #
  #################
  
	def application
	  
	  return @application ||= lambda do |environment|

  	  @request = ::Magnets::Request.new( ::Rack::Request.new( environment ) )

  	  return rack_response

    end
	  
  end

	#############################
  #  initialize_rack_request  #
  #############################

  def initialize_rack_request
    
    # reset status
		@status = 200
		::Magnets::Headers[ 'Content-Type' ] = 'text/html'
		
  end

	###################
  #  rack_response  #
  ###################
  
  def rack_response

    root_instance = @root.new
    
    puts 'class: ' + @root.to_s
    puts 'wtf: ' + root_instance.to_s
	  return ::Rack::Response.new( root_instance.to_html, 
																 @status, 
																 ::Magnets::Headers ).finish

  end
  
  #############
  #  status   #
  #  status=  #
  #############

  attr_accessor :status

  ###########
  #  root   #
  #  root=  #
  ###########
  
  attr_accessor :root

  ##############
  #  set_root  #
  ##############

  alias_method :set_root, :root=


end
