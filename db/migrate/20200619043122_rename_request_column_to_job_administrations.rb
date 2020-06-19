class RenameRequestColumnToJobAdministrations < ActiveRecord::Migration[6.0]
  def change
    rename_column :boards, :contents, :content
  end
end
