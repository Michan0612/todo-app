class RemoveBoardIdFromTasks < ActiveRecord::Migration[6.0]
  def change
    remove_column :tasks, :board_id, :bigint
  end
end
