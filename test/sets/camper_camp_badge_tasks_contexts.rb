module Contexts
  module CamperCampBadgeTasksContexts
    def create_camper_camp_badge_tasks
      @camper_task1 = FactoryBot.create(:camper_camp_badge_task, camper_camp_badge: @camper_camp_badge3, task: @task1, completed: true)
      @camper_task2 = FactoryBot.create(:camper_camp_badge_task, camper_camp_badge: @camper_camp_badge3, task: @task2, completed: true)
      @camper_task3 = FactoryBot.create(:camper_camp_badge_task, camper_camp_badge: @camper_camp_badge3, task: @task3, completed: true)
      @camper_task4 = FactoryBot.create(:camper_camp_badge_task, camper_camp_badge: @camper_camp_badge3, task: @task4, completed: true)
    end

    def delete_camper_camp_badge_tasks
      @camper_task1.delete
      @camper_task2.delete
      @camper_task3.delete
      @camper_task4.delete
    end
  end
end