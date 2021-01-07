class CreateGameNights < ActiveRecord::Migration[5.2]
  def change
    create_table :game_nights do |t|
      t.references :user, foreign_key: true
      t.string :name
      t.string :date
      t.integer :number_of_games

      t.timestamps
    end
  end
end
