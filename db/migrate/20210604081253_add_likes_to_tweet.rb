class AddLikesToTweet < ActiveRecord::Migration[6.1]
  def change
    create_table :likes, id: false do |t|
      t.belongs_to :liked, class_name: "Tweet"
      t.belongs_to :by, class_name: "User"

    end
    # add_index :UserToLikes, :user_id
    # add_index :UserToLikes, :tweet_id
    add_index :likes, [ :liked_id, :by_id ], unique: true
  end
end
