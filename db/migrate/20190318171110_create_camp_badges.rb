class CreateCampBadges < ActiveRecord::Migration[5.1]
  def change
    create_table :camp_badges do |t|
      t.references :badge, foreign_key: true
      t.references :camp, foreign_key: true

      t.timestamps
    end
  end
end
