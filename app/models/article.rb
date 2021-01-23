class Article < ApplicationRecord
  validates :title, :content, presence: true
  belongs_to :user
  has_many :comments
  has_many :images, dependent: :destroy
  has_many :likes
  has_many :liked_users, through: :likes, source: :user
  has_many :tag_relations, dependent: :destroy
  has_many :tag, through: :tag_relations
  accepts_nested_attributes_for :images, allow_destroy: true

  def self.search(search)
    return Article.all unless search
    Article.where('title LIKE(?)', "%#{search}%")
  end
  
  def save_tags(savearticle_tags)
    savearticle_tags.each do |new_name|
      article_tag = Tag.find_or_create_by(name: new_name)
      self.tag << article_tag
    end
  end
end
