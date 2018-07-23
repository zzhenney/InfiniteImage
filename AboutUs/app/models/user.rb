class User < ApplicationRecord
  include Clearance::User

  has_many :images                                       #association

  accepts_nested_attributes_for :images       #Needs to be reworked.
  validates_associated :images                #validates images
  #has_many_attached :uploads                       #Allow users to upload multiple images. Paul ANcajima

end
