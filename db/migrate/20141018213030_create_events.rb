class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.integer :user_id
      t.string :name
      t.text :description
      t.string :twitter_username
      t.string :twitter_hashtag
      t.float :lat
      t.float :lng
      
      t.timestamps
    end
  end
end
