class AddGameAtlasIdToGames < ActiveRecord::Migration[5.2]
  def change
    add_column :games, :atlas_id, :string
  end
end
