class Like < ApplicationRecord
  belongs_to :user
  belongs_to :post

  # Personalizated method
  def update_likes_counter
    post.update(likes_counter: post.likes.count)
  end
end
