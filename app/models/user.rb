class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  mount_uploader :image, ImageUploader
  
  validates :nickname, length: {maximum: 8}, presence: true
  validates :email, uniqueness: { case_sensitive: true }
  
  has_many :articles, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :likes, dependent: :destroy
  has_many :liked_articles, through: :likes, source: :article

  def already_liked?(article)
    self.likes.exists?(article_id: article.id)
  end

  def self.guest
    find_or_create_by(nickname: "guest", email: "guest@example.com") do |user|
      user.nickname = "guest"
      user.password = SecureRandom.urlsafe_base64
    end
  end
end
