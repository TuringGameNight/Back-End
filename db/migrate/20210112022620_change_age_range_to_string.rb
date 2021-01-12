class ChangeAgeRangeToString < ActiveRecord::Migration[5.2]
  def change
    change_column :games, :age_range, :string
  end
end
