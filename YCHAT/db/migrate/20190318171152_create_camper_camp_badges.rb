class CreateCamperCampBadges < ActiveRecord::Migration[5.1]
  def change
    create_table :camper_camp_badges do |t|
      t.references :camp_badge, foreign_key: true
      t.references :camper, foreign_key: true
      t.boolean :completed

      t.timestamps
    end
  end
end
