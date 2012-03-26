
#-----------------------------------------------------------------------------------------------------------#
#-----------------------------------  Rmagnets Application Controller  -------------------------------------#
#-----------------------------------------------------------------------------------------------------------#

module Rmagnets::ApplicationController

	attr_accessor		:request

  ###############
  #  self.call  #
  ###############

  def self.call( environment )

		self.request = Rack::Request.new( environment )
    
	  return Rack::Response.new(	primary_view_model.to_html( request ), 
																status, 
																'Content-Type' => 'text/html' ).finish
    
  end

  #################################
  #  self.primary_view_model=     #
  #  self.set_primary_view_model  #
  #################################

	def self.primary_view_model=( view_model_class )
		
		@primary_view_model = view_model_class
		
		return self
		
	end
	class << self ; alias_method :set_primary_view_model, :primary_view_model= ; end
  
  #############################
  #  self.primary_view_model  #
  #############################

	def self.primary_view_model
		return @primary_view_model
	end

  #################
  #  self.status  #
  #################

	def self.status
		return @status || 200
	end
	
end
