class CreateCamperRegistrations < ActiveRecord::Migration[5.1]
  def change
    create_table :camper_registrations do |t|
      t.references :camp, foreign_key: true
      t.references :camper, foreign_key: true

      t.timestamps
    end
  end
end
