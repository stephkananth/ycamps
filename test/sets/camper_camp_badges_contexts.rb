module Contexts
  module CamperCampBadgesContexts
    def create_camper_camp_badges
    end

    def delete_camper_camp_badges
    end

    def create_generic_camper_camp_badges
      @camper_camp_badge1 = FactoryBot.create(:camper_camp_badge, camp_badge: @camp_badge1, camper: @camper, completed: true)
      @camper_camp_badge2 = FactoryBot.create(:camper_camp_badge, camp_badge: @camp_badge2, camper: @camper, completed: true)
      @camper_camp_badge3 = FactoryBot.create(:camper_camp_badge, camp_badge: @camp_badge3, camper: @camper, completed: false)
    end

    def delete_generic_camper_camp_badges
      @camper_camp_badge1.delete
      @camper_camp_badge2.delete
      @camper_camp_badge3.delete
    end
  end
end