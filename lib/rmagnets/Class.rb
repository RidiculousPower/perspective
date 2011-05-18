
#-----------------------------------------------------------------------------------------------------------#
#-------------------------------------  Rmagnets Class Extension  ------------------------------------------#
#-----------------------------------------------------------------------------------------------------------#

class Class

	##########################
	#  rmagnets_view_model!  #
	##########################
	
	# an rmagnets view is an rmagnets view-model that can define sub-views as routes
	def rmagnets_view_model!
		
		rmagnets_view!
		
		include	Rmagnets::ViewModel
		extend	Rmagnets::ViewModel
		
		extend	Rmagnets::ViewModel::ClassInstance
		include	Rmagnets::ViewModel::ObjectInstance
		
		return self
		
	end
	
	###########################
	#  rmagnets_application!  #
	###########################

	# declaring class as an application enables instances of the class as an Rmagnets Rack app
	# this means it can be called directly using run: run ClassName.new
	def rmagnets_application!
		
		# enable our class as a Rack app
		define_method( :call ) do |environment|
		
			# call Rmagnets rack app
			return Rmagnets::ApplicationController.call( environment )
		
		end
		
	end

	##########################
	#  rmagnets_standalone!  #
	##########################
	
	# standalone means that the class is both an rmagnets application and an rmagnets view
	def rmagnets_standalone!

		rmagnets_application!
		rmagnets_view_model!

		return self

	end
	
end
