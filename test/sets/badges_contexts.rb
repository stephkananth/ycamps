module Contexts
  module BadgesContexts
    def create_badges
      @badge1 = FactoryBot.create(:badge, skill: @skill1, name: 'Archery 1', level: 1)
      @badge2 = FactoryBot.create(:badge, skill: @skill1, name: 'Archery 2', lever: 2)
      @badge3 = FactoryBot.create(:badge, skill: @skill3, name: 'First Aid 1', lever: 1)
    end

    def delete_badges
      @badge1.delete
      @badge2.delete
      @badge3.delete
    end
  end
end
