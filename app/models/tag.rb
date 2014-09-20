class Tag < ActiveRecord::Base
  has_many :post_tags, inverse_of: :tag
end
