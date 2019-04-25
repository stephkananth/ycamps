# frozen_string_literal: true

module Contexts
  module CampBadgesContexts
    def create_camp_badges;
    end

    def delete_camp_badges;
    end

    def create_generic_camp_badges
      @camp_badge1 = FactoryBot.create(:camp_badge, badge: @badge1a, camp: @camp1)
      @camp_badge2 = FactoryBot.create(:camp_badge, badge: @badge2a, camp: @camp2)
      @camp_badge3 = FactoryBot.create(:camp_badge, badge: @badge3a, camp: @camp3)
      @camp_badge4 = FactoryBot.create(:camp_badge, badge: @badge4a, camp: @camp3)
    end

    def delete_generic_camp_badges
      @camp_badge1.delete
      @camp_badge2.delete
      @camp_badge3.delete
      @camp_badge4.delete
    end

    def create_more_camp_badges
      @camp_badge4 = FactoryBot.create(:camp_badge, badge: @badge1, camp: @ldp_girls)
      @camp_badge5 = FactoryBot.create(:camp_badge, badge: @badge1, camp: @ldp_boys)
      @camp_badge6 = FactoryBot.create(:camp_badge, badge: @badge2, camp: @ldp_girls)
      @camp_badge7 = FactoryBot.create(:camp_badge, badge: @badge2, camp: @ldp_boys)
      @camp_badge8 = FactoryBot.create(:camp_badge, badge: @badge1, camp: @first_term)
    end

    def delete_more_camp_badges
      @camp_badge4.delete
      @camp_badge5.delete
      @camp_badge6.delete
      @camp_badge7.delete
      @camp_badge8.delete
    end
  end
end
