# frozen_string_literal: true

module Contexts
  module UsersContexts
    # create your contexts here...
    def create_users
      @admin_user = FactoryBot.create(:user)
      @counselor_user = FactoryBot.create(:user, email: 'counselor@ymca.org', role: 'counselor')
      @parent_user = FactoryBot.create(:user, email: 'parent@gmail.com', role: 'parent')
    end

    def delete_users
      @admin_user.delete
      @counselor_user.delete
      @parent_user.delete
    end
  end
end
