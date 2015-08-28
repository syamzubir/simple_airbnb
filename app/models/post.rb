#Here is property

class Post < ActiveRecord::Base

  validate :title, presence: true
  validate :content, presence: true

  has_many :post_tags
  has_many :tags, through: :post_tags

end