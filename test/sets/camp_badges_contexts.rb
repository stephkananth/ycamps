module Contexts
  module CampBadgesContexts
    def create_camp_badges
    end

    def delete_camp_badges
    end

    def create_generic_camp_badges
      @camp_badge1 = FactoryBot.create(:camp_badge, badge: @badge1a, camp: @camp1)
      @camp_badge2 = FactoryBot.create(:camp_badge, badge: @badge2a, camp: @camp2)
      @camp_badge3 = FactoryBot.create(:camp_badge, badge: @badge3a, camp: @camp3)
    end

    def delete_generic_camp_badges
      @camp_badge1.delete
      @camp_badge2.delete
      @camp_badge3.delete
    end
  end
end