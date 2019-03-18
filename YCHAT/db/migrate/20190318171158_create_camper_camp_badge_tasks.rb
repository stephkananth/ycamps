class CreateCamperCampBadgeTasks < ActiveRecord::Migration[5.1]
  def change
    create_table :camper_camp_badge_tasks do |t|
      t.references :camper_camp_badge, foreign_key: true
      t.references :task, foreign_key: true
      t.boolean :completed

      t.timestamps
    end
  end
end
