class PostComment < ApplicationRecord
  belongs_to :user
  belongs_to :post

  validates :username, presence: :true
  validates :body, presence: :true


end
