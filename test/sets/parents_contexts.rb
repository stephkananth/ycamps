module Contexts
  module ParentsContexts
    def create_parents
      @parent1 = FactoryBot.create(:parent, user: @parent_user)
    end

    def delete_parents
      @parent1.delete
    end
  end
end