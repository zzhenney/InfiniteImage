class User < ApplicationRecord
  has_many :images

  accepts_nested_attributes_for :images
  validates_associated :images
  has_many_attached :uploads

end
