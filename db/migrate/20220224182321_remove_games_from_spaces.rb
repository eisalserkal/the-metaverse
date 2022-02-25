class RemoveGamesFromSpaces < ActiveRecord::Migration[6.1]
  def change
    remove_column :spaces, :games
  end
end
