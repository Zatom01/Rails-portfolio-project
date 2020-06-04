class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable, :recoverable, :rememberable, :validatable, :omniauthable, omniauth_providers: [:github, :google_oauth2]

  has_many :posts
  has_many :post_comments ,:dependent => :destroy
  has_many :commented_posts, through: :post_comments, source: :post
  # has_many :posts, through: :post_comments, dependent: :delete_all

  has_many :movie_comments, :dependent => :destroy
  has_many :movies, through: :movie_comments



  scope :famous_users, -> {where("view > ?", 20)}



  def self.in_age(age)
      where(:age => age)
  end


  def self.create_from_provider_data(provider_data)
    where(provider: provider_data.provider, uid: provider_data.uid).first_or_create do |user|
      user.email = provider_data.info.email
      user.password = Devise.friendly_token[0, 20]
    end
  end





end
