module CamperCampBadgesHelper
  def create_camper_tasks(badge, camper_camp_badge)
    camp_tasks = badge.tasks

    camp_tasks.each do |task|
      new_task = CamperCampBadgeTask.new(camper_camp_badge_id: camper_camp_badge.id, task_id: task.id, completed: false)
      new_task.save!
    end
  end
end
