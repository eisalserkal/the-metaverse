class AddGamesToSpace < ActiveRecord::Migration[6.1]
  def change
    add_column :spaces, :games, :string
  end
end
