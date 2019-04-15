class CreateCampCounselors < ActiveRecord::Migration[5.1]
  def change
    create_table :camp_counselors do |t|
      t.references :camp, foreign_key: true
      t.references :counselor, foreign_key: true

      t.timestamps
    end
  end
end
