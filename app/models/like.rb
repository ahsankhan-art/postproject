class Like < ApplicationRecord
  belongs_to :post
  belongs_to :user

  def self.already_liked?(post_id, user_id)
    Like.where(user_id: user_id, post_id: post_id).exists?
  end
end
