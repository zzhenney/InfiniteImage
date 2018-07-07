class Image < ApplicationRecord
  belongs_to :user, optional: true
  #sets up images for active storage
  has_many_attached :uploads
end
