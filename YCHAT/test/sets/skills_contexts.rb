module Contexts
  module SkillsContexts
    def create_skills
      @skill1 = FactoryBot.create(:skill, name: 'Archery', category: 'Sports')
      @skill2 = FactoryBot.create(:skill, name: 'Frisbee', category: 'Sports')
      @skill3 = FactoryBot.create(:skill, name: 'First Aid', category: 'Survival')
    end

    def delete_skills
      @skill1.delete
      @skill2.delete
      @skill3.delete
    end
  end
end
