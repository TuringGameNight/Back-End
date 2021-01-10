class RemoveAtlasIdFromGame < ActiveRecord::Migration[5.2]
  def change
    remove_column :games, :atlas_id
  end
end
