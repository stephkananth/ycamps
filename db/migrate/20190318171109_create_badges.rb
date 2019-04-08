class CreateBadges < ActiveRecord::Migration[5.1]
  def change
    create_table :badges do |t|
      t.string :name
      t.integer :level
      t.text :description
      t.references :skill, foreign_key: true

      t.timestamps
    end
  end
end
