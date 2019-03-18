class CreateCounselorCampBadges < ActiveRecord::Migration[5.1]
  def change
    create_table :counselor_camp_badges do |t|
      t.references :camp_badge, foreign_key: true
      t.references :counselor, foreign_key: true

      t.timestamps
    end
  end
end
