# frozen_string_literal: true

module Contexts
  module UsersContexts
    # create your contexts here...
    def create_users
      @admin_user = FactoryBot.create(:user)
      @counselor_user = FactoryBot.create(:user, email: 'counselor@ymca.org', role: 'counselor')
      @parent_user = FactoryBot.create(:user, email: 'parent@gmail.com', role: 'parent')

      # parents
      @profh_user = FactoryBot.create(:user, email: 'profh@example.com', first_name: 'Larry', last_name: 'Heimann', role: 'parent')
      @ananth_user = FactoryBot.create(:user, email: 'theananthfamily@gmail.com', first_name: 'Aneena', last_name: 'Ananth', role: 'parent')
      @tables_user = FactoryBot.create(:user, email: 'lisa@example.com', first_name: 'Lisa', last_name: 'Tables', role: 'parent')
      @inactive_parent = FactoryBot.create(:user, email: 'inactive@example.com', first_name: 'Parent', last_name: 'Inactive', role: 'parent') # inactive

      # counselors
      @becca_user = FactoryBot.create(:user, email: 'becca@example.com', first_name: 'Becca', last_name: 'Kern', role: 'counselor')
      @steph_user = FactoryBot.create(:user, email: 'steph@example.com', first_name: 'Steph', last_name: 'Ananth', role: 'counselor')
      @matt_user = FactoryBot.create(:user, email: 'matt@example.com', first_name: 'Matt', last_name: 'Kern', role: 'counselor')
      @hannah_user = FactoryBot.create(:user, email: 'hannah@example.com', first_name: 'Hannah', last_name: 'Kern', role: 'counselor') # inactive
    end

    def delete_users
      @admin_user.delete
      @counselor_user.delete
      @parent_user.delete

      @profh_user.delete
      @ananth_user.delete
      @tables_user.delete
      @inactive_parent.delete

      @becca_user.delete
      @steph_user.delete
      @matt_user.delete
      @hannah_user.delete
    end

    def create_generic_user
      @user = FactoryBot.create(:user, email: 'user@example.com', first_name: 'User', last_name: 'Example', role: 'counselor')
    end

    def delete_generic_user
      @user.delete
    end
  end
end
