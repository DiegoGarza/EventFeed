class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.integer :user_id
      t.integer :event_id
      t.text :comment
      t.integer :score

      t.timestamps
    end
  end
end
