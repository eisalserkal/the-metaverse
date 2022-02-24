class AddOverviewToSpace < ActiveRecord::Migration[6.1]
  def change
    add_column :spaces, :overview, :string
  end
end
