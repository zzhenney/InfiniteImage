class Category < ApplicationRecord
  has_many :images
  searchkick

  #Paul Ancajima 7/17/18
  # def self.ransackable_attributes(auth_object = nil)          #Paul Ancajima
  #   if auth_object == :admin      #need to create this        #Only admin can search everything
  #     # whitelist all attributes for admin
  #     super
  #   else
  #     # whitelist only the category attributes
  #     super & %w(name)                                        #Can only search for Category names
  #   end
  # end
end
