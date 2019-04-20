class AddOrderToTasks < ActiveRecord::Migration[5.1]
  def change
    add_column :tasks, :order, :integer
  end
end
