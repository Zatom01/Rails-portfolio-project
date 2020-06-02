class Post < ApplicationRecord

    has_many :post_comments, :dependent => :destroy
    has_many :users, through: :post_comments

    validates :content, presence: :true







end
