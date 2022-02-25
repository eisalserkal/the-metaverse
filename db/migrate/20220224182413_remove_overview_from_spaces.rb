class RemoveOverviewFromSpaces < ActiveRecord::Migration[6.1]
  def change
    remove_column :spaces, :overview
  end
end
