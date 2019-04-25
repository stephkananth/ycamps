# frozen_string_literal: true

require 'time'

module Contexts
  module CampsContexts
    def create_camps
      @first_term = FactoryBot.create(:camp, location: @sbtw, name: 'First Term', program: 'Program 1', start_date: Date.parse('2019-06-23'), end_date: Date.parse('2019-07-05'))
      @second_term = FactoryBot.create(:camp, location: @sbtw, name: 'Second Term', program: 'Program 2', start_date: Date.parse('2019-07-07'), end_date: Date.parse('2019-07-19'))
      @third_term = FactoryBot.create(:camp, location: @sbtw, name: 'Third Term', program: 'Program 3', start_date: Date.parse('2019-07-21'), end_date: Date.parse('2019-08-02'))
      @fourth_term = FactoryBot.create(:camp, location: @sbtw, name: 'Fourth Term', program: 'Program 4', start_date: Date.parse('2019-08-04'), end_date: Date.parse('2019-08-16'))
      @ldp_girls = FactoryBot.create(:camp, location: @deer_run, name: 'LDP at Deer Run', program: 'Leadership Development', start_date: Date.parse('2019-06-23'), end_date: Date.parse('2019-08-17'))
      @ldp_boys = FactoryBot.create(:camp, location: @brookwoods, name: 'LDP at Brookwoods', program: 'Leadership Development', start_date: Date.parse('2019-06-23'), end_date: Date.parse('2019-08-17'))
      @inactive_camp = FactoryBot.create(:camp, location: @sbtw, name: 'Inactive Term', program: 'Inactive Program', start_date: Date.parse('2019-08-01'), end_date: Date.parse('2019-08-15'), active: false)
    end

    def delete_camps
      @first_term.delete
      @second_term.delete
      @third_term.delete
      @fourth_term.delete
      @ldp_girls.delete
      @ldp_boys.delete
      @inactive_camp.delete
    end

    def create_generic_camps
      @camp1 = FactoryBot.create(:camp, location: @location, name: 'Camp 1', program: 'Camp 1', start_date: Date.parse('2001-02-03'), end_date: Date.parse('2002-02-03'), active: true)
      @camp2 = FactoryBot.create(:camp, location: @location, name: 'Camp 2', program: 'Camp 2', start_date: Date.parse('2019-04-10'), end_date: Date.yesterday - 1, active: true)
      @camp3 = FactoryBot.create(:camp, location: @location, name: 'Camp 3', program: 'Camp 3', start_date: Date.today, end_date: Date.tomorrow, active: true)
    end

    def delete_generic_camps
      @camp1.delete
      @camp2.delete
      @camp3.delete
    end
  end
end
