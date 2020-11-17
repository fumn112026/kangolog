class Article < ApplicationRecord
  validates :title, :content, presence: true
  belongs_to :user
  has_many :comments
  has_many :images, dependent: :destroy
  has_many :likes
  has_many :liked_users, through: :likes, source: :uesr
  accepts_nested_attributes_for :images, allow_destroy: true


  def self.search(search)
    return Article.all unless search
    Article.where('title LIKE(?)', "%#{search}%")
  end
end
