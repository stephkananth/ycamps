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
  end
end