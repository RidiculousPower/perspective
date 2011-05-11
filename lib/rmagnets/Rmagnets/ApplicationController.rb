
#-----------------------------------------------------------------------------------------------------------#
#-----------------------------------  Rmagnets Application Controller  -------------------------------------#
#-----------------------------------------------------------------------------------------------------------#

class Rmagnets::ApplicationController

	attr_accessor		:request, :route, :page

	# singleton - don't allow instances to be created
	class << self ; undef_method( :new ) ; end

  ###############
  #  self.call  #
  ###############

  def self.call( environment )

		@request	= Rack::Request.new( environment )
    
    @route 		= Rmagnets::Router.route_for_request( request )
    
		@page			=	@route.page

	  return Rack::Response.new(	@page.body, @page.status, 'Content-Type' => 'text/xhtml' ).finish
    
  end

end
