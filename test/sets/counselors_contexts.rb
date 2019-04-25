# frozen_string_literal: true

module Contexts
  module CounselorsContexts
    def create_counselors
      @becca = FactoryBot.create(:counselor, user: @becca_user)
      @steph = FactoryBot.create(:counselor, user: @steph_user)
      @matt = FactoryBot.create(:counselor, user: @matt_user)
      @hannah = FactoryBot.create(:counselor, user: @hannah_user, active: false)
    end

    def delete_counselors
      @becca.delete
      @steph.delete
      @matt.delete
      @hannah.delete
    end
  end
end
