
class Post < ActiveRecord::Base
   # Remember to create a migration!
  has_many :post_tags
  has_many :tags, through: :post_tags

  validates :content, :presence => true
  validates :title, :presence => true

end