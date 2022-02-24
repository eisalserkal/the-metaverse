class DropVrHeadsets < ActiveRecord::Migration[6.1]
  def change
    drop_table :vr_headsets
  end
end
