
module ::Magnets

  ResponseType = { 'Content-Type' => 'text/html' }

  Application = lambda do |environment|
	  
	  @request = ::Magnets::Request.new( ::Rack::Request.new( environment ) )

	  return ::Rack::Response.new( 'Hello World! -Magnets',#@root.to_html, 
																 @status || 200, 
																 ::Magnets::ResponseType ).finish
		
  end

  ###############
  #  self.call  #
  ###############

  def self.call( environment )
		
		@status = nil
		
		@session = ::Magnets::Session.new( ::Magnets::Application )
		
		return @session.call( environment )
	
	end

  ##################
  #  self.session  #
  #  self.request  #
  #  self.root     #
  #  self.status  #
  ##################

	class << self
	  attr_reader	:session, :request, :root, :status
  end


  ###################
  #  self.root=     #
  #  self.set_root  #
  ###################

	def self.root=( router_or_view_model_module )
		
		@root = router_or_view_model_module
		
		return self
		
	end
	class << self
	  alias_method :set_root, :root=
	end

end
