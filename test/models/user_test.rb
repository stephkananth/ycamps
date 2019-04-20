require 'test_helper'

class UserTest < ActiveSupport::TestCase
  should have_secure_password

  # test validations
  should validate_presence_of(:email)
  should validate_uniqueness_of(:email).case_insensitive
  should validate_presence_of(:last_name)
  should validate_presence_of(:first_name)

  should allow_value('admin').for(:role)
  should allow_value('counselor').for(:role)
  should allow_value('parent').for(:role)
  should_not allow_value('bad').for(:role)
  should_not allow_value('hacker').for(:role)
  should_not allow_value(10).for(:role)
  should_not allow_value('leader').for(:role)
  should_not allow_value(nil).for(:role)

  should allow_value('fred@ymca.com').for(:email)
  should allow_value('fred@andrew.cmu.edu').for(:email)
  should allow_value('my_fred@ymca.org').for(:email)
  should allow_value('fred123@ymca.gov').for(:email)
  should allow_value('my.fred@ymca.net').for(:email)

  should_not allow_value('fred').for(:email)
  should_not allow_value('fred@fred,com').for(:email)
  should_not allow_value('fred@fred.uk').for(:email)
  should_not allow_value('my fred@fred.com').for(:email)
  should_not allow_value('fred@fred.con').for(:email)
  should_not allow_value(nil).for(:email)

  # context
  context 'Within context' do
    setup do
      create_users
    end

    teardown do
      delete_users
    end

    should 'require users to have unique emails' do
      assert_equal 'kblack@ymca.org', @admin_user.email
      assert_not_equal 'kbla2ck@ymca.org', @admin_user.email
      assert_equal 'parent@gmail.com', @parent_user.email
      @admin_user.email = 'parent@gmail.com'
      deny @admin_user.valid?, @admin_user.email.to_s
    end

    should 'allow user to authenticate with password' do
      # assert @admin_user.authenticate("secret123")
      deny @admin_user.authenticate('notsecret')
    end

    should 'require a password for new users' do
      bad_user = FactoryBot.build(:user, email: 'tank@gmail.com', password: nil)
      deny bad_user.valid?
    end

    should 'require passwords to be confirmed and matching' do
      bad_user_1 = FactoryBot.build(:user, email: 'parent2@gmail.com', password: 'secret123', password_confirmation: nil)
      deny bad_user_1.valid?
      bad_user_2 = FactoryBot.build(:user, email: 'parent3@gmail.com', password: 'secret123', password_confirmation: 'sauce')
      deny bad_user_2.valid?
    end

    # should 'require passwords to be at least eight characters' do
    #   bad_user = FactoryBot.build(:user, username: '', password: 'no')
    #   deny bad_user.valid?
    # end

    should 'have a role? method for authorization' do
      assert @admin_user.role?(:admin)
      assert @counselor_user.role?(:counselor)
      assert @parent_user.role?(:parent)
    end

    should 'show that authenticate method works' do
      test_user = FactoryBot.create(:user, email: 'stephk@example.com', password: 'secret123', first_name: 'Steph', last_name: 'Ananth', role: 'admin')
      assert test_user.authenticate('secret123')
      deny test_user.authenticate('secret')
      assert User.authenticate('stephk@example.com', 'secret123')
      deny User.authenticate('stephk@example.com', 'secret')
      test_user.delete
    end
  end
end
