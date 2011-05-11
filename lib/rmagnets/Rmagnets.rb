
#-----------------------------------------------------------------------------------------------------------#
#---------------------------------------------  Rmagnets  --------------------------------------------------#
#-----------------------------------------------------------------------------------------------------------#

class Rmagnets

	attr_accessor	:session

	# singleton - don't allow instances to be created
	class << self ; undef_method( :new ) ; end

  ###############
  #  self.call  #
  ###############

  def self.call
		return ( @session = Rmagnets::Session.new( Rmagnets::ApplicationController ) ).call
	end
	
end
