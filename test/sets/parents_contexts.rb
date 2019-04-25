# frozen_string_literal: true

module Contexts
  module ParentsContexts
    def create_parents
      @profh = FactoryBot.create(:parent, user: @profh_user)
      @ananth = FactoryBot.create(:parent, user: @ananth_user)
      @tables = FactoryBot.create(:parent, user: @tables_user)
      @inactive = FactoryBot.create(:parent, user: @inactive_parent, active: false)
    end

    def delete_parents
      @profh.delete
      @ananth.delete
      @tables.delete
      @inactive.delete
    end

    def create_generic_parent
      @parent = FactoryBot.create(:parent, user: @user)
    end

    def delete_generic_parent
      @parent.delete
    end
  end
end
