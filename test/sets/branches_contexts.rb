# frozen_string_literal: true

module Contexts
  module BranchesContexts
    def create_branches
      @thelma_lovette = FactoryBot.create(:branch)
      @olympus = FactoryBot.create(:branch, name: 'Olympus')
      @north_boroughs = FactoryBot.create(:branch, name: 'North Boroughs')
    end

    def delete_branches
      @thelma_lovette.delete
      @olympus.delete
      @north_boroughs.delete
    end

    def create_more_branches
      @new_england = FactoryBot.create(:branch, name: 'New England')
      @pennsylvania = FactoryBot.create(:branch, name: 'Pennsylvania')
    end

    def delete_more_branches
      @new_england.delete
      @pennsylvania.delete
    end
  end
end
