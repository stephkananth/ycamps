# frozen_string_literal: true

module CamperCampBadgesHelper
	def create_camper_camp_badges(camp_badge, campers)
		created_all_camper_camp_badges = true
    campers.each do |camper_id|
			camper_cb = CamperCampBadge.new(camp_badge_id: camp_badge.id, camper_id: camper_id)	
			if !camper_cb.save
				created_all_camper_camp_badges = false
				flash[:notice] = "Unable to create camper camp badges."
				redirect_to new_camper_camp_badge_path(camp_badge_id: camp_badge_id)
			else	
    		create_camper_tasks(camp_badge.badge, camper_cb)
			end
	  end
    if created_all_camper_camp_badges
 	    	redirect_to CampBadge.find(camp_badge.id), notice: 'Camper camp badges were successfully created.'
		end
	end

  def create_camper_tasks(badge, camper_camp_badge)
    camp_tasks = badge.tasks

    camp_tasks.each do |task|
      new_task = CamperCampBadgeTask.new(camper_camp_badge_id: camper_camp_badge.id, task_id: task.id, completed: false)
      new_task.save!
    end
  end
end