class AddColumnToGames < ActiveRecord::Migration[5.2]
  def change
    add_column :games, :num_players, :string
  end
end
