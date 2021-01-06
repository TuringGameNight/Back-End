class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :google_id
      t.string :name
      t.string :image
      t.string :google_token
      t.string :refresh_token
      t.string :auth_token

      t.timestamps
    end
  end
end
