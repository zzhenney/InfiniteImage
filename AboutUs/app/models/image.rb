class Image < ApplicationRecord
  belongs_to :user, optional: true #optional needs rework. Maybe option for admin?. Paul Ancajima

  has_many_attached :uploads #sets up images for active storage.     Paul ANcajima
  #var ":uploads" can be called anything must be accepted in params of controller IE. images_controller "

  validate :correct_uploads_type #validate image types Paul Ancajima 7/17/18

  validates_length_of :description, :minimum => 5, :maximum => 40, :allow_blank => true #validate description length Paul Ancajima 7/17/18

  #foreign key set up
  belongs_to :category #inherits category @image.category.<etc>
  belongs_to :status

  # Author: Andre Leslie
  # Purpose: Resize images then save them into database
  # Methods to Note: 'thumbnail' formats image to thumbnail size and saves to database
  #                  'full_size' formats image to display size abd saves to database
  # Date: 7/10/18
  def thumbnail select
    return self.uploads[select].variant(resize: "300x300!").processed
  end

  def full_size select
    return self.uploads[select].variant(resize: "700x700").processed
  end
  #########################################################################

  private
  #Paul Ancajima 7/17/18
  def correct_uploads_type
    if uploads.attached? == false                         #if uploads are not attached
      errors.add(:uploads, 'Must have image files')         #error thrown
    end
    uploads.each do |u|                                             #each upload do
      if !u.content_type.in?(%('image/jpeg image/png image/gif'))   #if content type does not match (NOTE: image/jpeg etc is the type of content)
        errors.add(:uploads, 'Must be jpeg or png file')            #throw error
      end
    end
  end

end