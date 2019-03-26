module Contexts
  module Locations
    # create your contexts here...
    def create_locations
      create_branches
      @thelma_lovette_y = FactoryBot.create(:location, branch: @thelma_lovette)
      @olympus_y = FactoryBot.create(:location, name: "Olympus", branch:  @olympus)
      @avonworth = FactoryBot.create(:location, name: "Avonworth Community Park", branch: @north_boroughs)
    end

    def delete_locations
      @thelma_lovette_y.delete
      @olympus_y.delete
      @avonworth.delete
      delete_branches
    end
  end
end