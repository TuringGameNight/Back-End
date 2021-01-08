class ChangeAgeToInt < ActiveRecord::Migration[5.2]
  def change
    remove_column :games, :age_range
    add_column :games, :age_range, :integer
  end
end
