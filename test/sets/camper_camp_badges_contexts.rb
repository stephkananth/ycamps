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
      @camper_camp_badge4 = FactoryBot.create(:camper_camp_badge, camp_badge: @camp_badge4, camper: @camper, completed: false)
    end

    def delete_generic_camper_camp_badges
      @camper_camp_badge1.delete
      @camper_camp_badge2.delete
      @camper_camp_badge3.delete
      @camper_camp_badge4.delete
    end

    def create_more_semi_generic_camper_camp_badges
      @camper_camp_badge4 = FactoryBot.create(:camper_camp_badge, camp_badge: @camp_badge3, camper: @alex, completed: true)
      @camper_camp_badge5 = FactoryBot.create(:camper_camp_badge, camp_badge: @camp_badge3, camper: @mark, completed: true)
    end

    def delete_more_semi_generic_camper_camp_badges
      @camper_camp_badge4.delete
      @camper_camp_badge5.delete
    end

    def create_incomplete_camper_camp_badges
      @camper_camp_badge6 = FactoryBot.create(:camper_camp_badge, camp_badge: @camp_badge1, camper: @alex, completed: false)
      @camper_camp_badge7 = FactoryBot.create(:camper_camp_badge, camp_badge: @camp_badge1, camper: @mark, completed: false)
      @camper_camp_badge8 = FactoryBot.create(:camper_camp_badge, camp_badge: @camp_badge2, camper: @alex, completed: false)
      @camper_camp_badge9 = FactoryBot.create(:camper_camp_badge, camp_badge: @camp_badge2, camper: @mark, completed: false)
    end

    def delete_incomplete_camper_camp_badges
      @camper_camp_badge6.delete
      @camper_camp_badge7.delete
      @camper_camp_badge8.delete
      @camper_camp_badge9.delete
    end
  end
end