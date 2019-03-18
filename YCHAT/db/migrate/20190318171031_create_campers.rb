class CreateCampers < ActiveRecord::Migration[5.1]
  def change
    create_table :campers do |t|
      t.references :parent, foreign_key: true
      t.string :first_name
      t.string :last_name
      t.boolean :active

      t.timestamps
    end
  end
end
