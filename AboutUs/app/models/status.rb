class Status < ApplicationRecord
  searchkick #searchkick added to allow indexing
  has_many :images, dependent: :destroy
end
