class CreateGames < ActiveRecord::Migration[5.2]
  def change
    create_table :games do |t|
      t.string :name
      t.string :type
      t.string :description
      t.string :age_range
      t.integer :duration
      t.string :image

      t.timestamps
    end
  end
end
