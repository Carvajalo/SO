class Like < ApplicationRecord
    belongs_to :tweet, :foreign_key => :liked_id, class_name: "Tweet"
    belongs_to :user, :foreign_key => :by_id, class_name: "User"

    validates_uniqueness_of :by_id, :scope => :liked_id


    scope :between, -> (liked_id, by_id) do
        where("(like.liked_id = ? AND like.by_id = ?", 
        liked_id, by_id)
    end


    validates :liked_id, presence: true
    validates :by_id, presence: true


end
