class Likes < ActiveRecord::Migration[6.1]
  def change
    add_column :tweets, :likes_count, :integer, null: false, default: 0
  end
end
