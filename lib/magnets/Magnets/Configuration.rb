
module ::Magnets::Configuration

	###############################
	#  self.session_storage_port  #
	###############################
	
	def self.session_storage_port
	  
	  return @session_storage_port || ::Persistence.current_port
	  
  end
	
end
