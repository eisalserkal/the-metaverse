class AddGamesToSpaces < ActiveRecord::Migration[6.1]
  def change
    add_column :spaces, :games, :text
  end
end
