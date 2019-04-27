module CamperRegistrationsHelper
	def create_camper_registrations(camp_id, campers)
		created_all_campers = true
    	campers.each do |camper_id|
			camper_registration = CamperRegistration.new(camp_id: camp_id, camper_id: camper_id)	
			if !camper_registration.save
				created_all_campers = false
				flash[:notice] = "Student is already registered for this camp."
				redirect_to new_camper_registration_path(camp_id: camp_id)
			end
	    end
	    if created_all_campers
   	    	redirect_to Camp.find(camp_id), notice: 'Camper registration was successfully created.'
  		end
  end
end
