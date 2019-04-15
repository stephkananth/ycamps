class AddProfhToUsers < ActiveRecord::Migration[5.1]
  def change
        profh_user = User.new
        profh_user.role = "admin"
        profh_user.email = "profh@cmu.edu"
        profh_user.password = "secret123"
        profh_user.password_confirmation = "secret123"
        profh_user.first_name = "Prof."
        profh_user.last_name = "H"
        profh_user.save!
  end
end
