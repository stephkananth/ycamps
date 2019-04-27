class CreateRosters < ActiveRecord::Migration[5.1]
  def change
    create_table :rosters do |t|
      t.string :file

      t.timestamps
    end
  end
end
