#here is tags

class Tag < ActiveRecord::Base

  validate :name, presence: true

  has_many :post_tags
  has_many :posts, through: :post_tags

end