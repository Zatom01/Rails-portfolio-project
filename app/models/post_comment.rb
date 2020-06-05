class PostComment < ApplicationRecord
  belongs_to :user
  belongs_to :post

  validates :username, presence: :true
  validates :body, presence: :true



  def self.all_comments_counts
    all.count
  end

end
