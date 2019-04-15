module Contexts
  module CampersContexts
    def create_campers
      @alex = FactoryBot.create(:camper, parent: @profh, first_name: 'Alex', last_name: 'Heimann')
      @mark = FactoryBot.create(:camper, parent: @profh, first_name: 'Mark', last_name: 'Heimann')
      @rachel = FactoryBot.create(:camper, parent: @profh, first_name: 'Rachel', last_name: 'Heimann', active: false)
    end

    def delete_campers
      @alex.delete
      @mark.delete
      @rachel.delete
    end
  end
end