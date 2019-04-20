module AssignMilestoneHelper
  def assign_milestones_to_campers(task_id, camp_badge_id, campers)
    campers.each do |camper|
      ccb = CamperCampBadge.where(camp_badge_id: camp_badge_id, camper_id: camper).first
      camper_camp_badge_task = CamperCampBadgeTask.where(task_id: task_id, camper_camp_badge_id: ccb.id).first
      camper_camp_badge_task.completed = true
      camper_camp_badge_task.save
    end
  end
end
