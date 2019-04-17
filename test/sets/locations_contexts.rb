# frozen_string_literal: true

module Contexts
  module LocationsContexts
    def create_locations
      @thelma_lovette_y = FactoryBot.create(:location, branch: @thelma_lovette)
      @olympus_y = FactoryBot.create(:location, name: 'Olympus', branch: @olympus)
      @avonworth = FactoryBot.create(:location, name: 'Avonworth Community Park', branch: @north_boroughs)
    end

    def delete_locations
      @thelma_lovette_y.delete
      @olympus_y.delete
      @avonworth.delete
    end

    def create_more_locations
      # @deer_run = FactoryBot.create(:location, branch: @new_england)
      # @brookwoods = FactoryBot.create(:location, branch: @new_england)
      # @sbtw = FactoryBot.create(:location, branch: @pennsylvania)
    end

    def delete_more_locations
      # @deer_run.delete
      # @brookwoods.delete
      # @sbtw.delete
    end

    def create_generic_location
      @location = FactoryBot.create(:location, branch: @branch, name: 'Location')
    end

    def delete_generic_location
      @location.delete
    end
  end
end
