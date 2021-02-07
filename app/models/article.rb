class Article < ApplicationRecord
  validates :title, length: {maximum: 60}, presence: true 
  validates :content, presence: true
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
    current_tags = self.tag.pluck(:name) unless self.tag.nil?
    old_tags = current_tags - savearticle_tags
    new_tags = savearticle_tags - current_tags

    old_tags.each do |old_name|
      self.tag.delete Tag.find_by(name: old_tags)
    end

    new_tags.each do |new_name|
      article_tag = Tag.find_or_create_by(name: new_name)
      self.tag << article_tag
    end
  end
end
