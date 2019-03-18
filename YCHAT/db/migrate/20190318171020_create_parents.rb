class CreateParents < ActiveRecord::Migration[5.1]
  def change
    create_table :parents do |t|
      t.references :user, foreign_key: true
      t.boolean :active

      t.timestamps
    end
  end
end
