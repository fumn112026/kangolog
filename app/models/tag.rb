class Tag < ApplicationRecord
  has_many :tag_relations, dependent: :destroy
  has_many :articles, through: :tag_relations
  validates :name, presence: true, uniqueness: true
end
