class Post < ApplicationRecord

    belongs_to :user
    has_many :post_comments , dependent: :delete_all
    has_many :users_who_commented, through: :post_comments, source: :user

    validates :content, presence: :true


end
