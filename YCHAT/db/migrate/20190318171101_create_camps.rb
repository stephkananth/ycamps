class CreateCamps < ActiveRecord::Migration[5.1]
  def change
    create_table :camps do |t|
      t.string :name
      t.string :program
      t.date :start_date
      t.date :end_date
      t.boolean :active
      t.references :location, foreign_key: true

      t.timestamps
    end
  end
end
