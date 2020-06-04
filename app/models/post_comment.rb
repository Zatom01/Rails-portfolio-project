class PostComment < ApplicationRecord
  belongs_to :user
  belongs_to :post

  def self.all_comments_counts
    all.count
  end

end
