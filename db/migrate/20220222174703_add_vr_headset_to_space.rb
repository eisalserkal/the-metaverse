class AddVrHeadsetToSpace < ActiveRecord::Migration[6.1]
  def change
    add_column :spaces, :vr_headset, :string
  end
end
