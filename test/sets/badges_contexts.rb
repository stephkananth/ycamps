module Contexts
  module BadgesContexts
    def create_badges
      @badge1 = FactoryBot.create(:badge, skill: @skill1, name: 'Archery 1', level: 1)
      @badge2 = FactoryBot.create(:badge, skill: @skill1, name: 'Archery 2', level: 2)
      @badge3 = FactoryBot.create(:badge, skill: @skill3, name: 'First Aid 1', level: 1)
    end

    def delete_badges
      @badge1.delete
      @badge2.delete
      @badge3.delete
    end

    def create_generic_badges
      @badge1a = FactoryBot.create(:badge, skill: @skill, name: 'Badge 1', level: 1)
      @badge2a = FactoryBot.create(:badge, skill: @skill, name: 'Badge 2', level: 2)
      @badge3a = FactoryBot.create(:badge, skill: @skill, name: 'Badge 3', level: 3)
      @badge4a = FactoryBot.create(:badge, skill: @skill, name: 'First Aid 2', level: 2)
    end

    def delete_generic_badges
      @badge1a.delete
      @badge2a.delete
      @badge3a.delete
      @badge4a.delete
    end
  end
end
