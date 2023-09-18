class Post < ApplicationRecord
  belongs_to :author, class_name: 'User', foreign_key: :author_id
  has_many :comments
  has_many :likes

  after_save :update_post_counter

  # Public Methods
  def five_most_recent_comments
    comments.order(created_at: :desc).limit(5)
  end

  private

  def update_post_counter
    author.update(post_counter: author.posts.count)
  end
end
