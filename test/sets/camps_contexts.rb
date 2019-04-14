module Contexts
  module CampsContexts
    def create_camps
      @camp1 = FactoryBot.create(:camp, location: @thelma_lovette_y)
    end

    def delete_camps
      @camp1.delete
    end
  end
end
