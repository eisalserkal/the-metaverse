class AddOverviewToSpaces < ActiveRecord::Migration[6.1]
  def change
    add_column :spaces, :overview, :text
  end
end
