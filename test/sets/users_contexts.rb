# frozen_string_literal: true

module Contexts
  module UsersContexts
    # create your contexts here...
    def create_users
      @admin_user = FactoryBot.create(:user)
      @counselor_user = FactoryBot.create(:user, email: 'counselor@ymca.org', role: 'counselor')
      @parent_user = FactoryBot.create(:user, email: 'parent@gmail.com', role: 'parent')

      @profh_user = FactoryBot.create(:user, email: 'profh@example.com', first_name: 'Larry', last_name: 'Heimann', role: 'parent')
      @ananth_user = FactoryBot.create(:user, email: 'theananthfamily@gmail.com', first_name: 'Aneena', last_name: 'Ananth', role: 'parent')
      @tables_user = FactoryBot.create(:user, email: 'lisa@example.com', first_name: 'Lisa', last_name: 'Tables', role: 'parent')

      @inactive_parent = FactoryBot.create(:user, email: 'inactive@example.com', first_name: 'Parent', last_name: 'Inactive', role: 'parent')
    end

    def delete_users
      @admin_user.delete
      @counselor_user.delete
      @parent_user.delete

      @profh_user.delete
      @ananth_user.delete
      @tables_user.delete
    end
  end
end
