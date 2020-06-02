class Movie < ApplicationRecord
    has_many :movie_comments, :dependent => :destroy
    has_many :users, through: :movie_comments
end
