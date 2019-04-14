module Contexts
  module ParentsContexts
    def create_parents
      @parent1 = FactoryBot.create(:parent)
    end

    def delete_parents
    end
  end
end