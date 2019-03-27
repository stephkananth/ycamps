module Contexts
  module Branches
    # create your contexts here...
    def create_branches
      @thelma_lovette = FactoryBot.create(:branch)
      @olympus = FactoryBot.create(:branch, name: "Olympus")
      @north_boroughs = FactoryBot.create(:branch, name: "North Boroughs")
    end

    def delete_branches
      @thelma_lovette.delete
      @olympus.delete
      @north_boroughs.delete
    end
  end
end