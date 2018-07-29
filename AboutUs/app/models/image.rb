class Image < ApplicationRecord

  belongs_to :user, optional: true #optional needs rework. Maybe option for admin?. Paul Ancajima

  has_many_attached :uploads #sets up images for active storage.     Paul ANcajima
  #var ":uploads" can be called anything must be accepted in params of controller IE. images_controller "

  validate :correct_uploads_type #validate image types Paul Ancajima 7/17/18

  validates_length_of :description, :minimum => 5, :maximum => 40, :allow_blank => true #validate description length Paul Ancajima 7/17/18

  #foreign key set up
  belongs_to :category #inherits category @image.category.<etc>
  belongs_to :status

  # Author: Paul Ancajima
  # Purpose: New search gem 'searchkick' with better features see https://github.com/ankane/searchkick for more details
  # Methods to Note: 'searchkick' is required to allow the model to be searched
  #                  'after_commit' is used to reindex all searchable takes arguement reindex_user_category_status
  #                  'reindex_user_category_status' is needed because searchkick does not reindex associations if theyre updated
  #                  'search_data' allows associated models and their fields be searchable
  # Date: 7/27/18
  searchkick callbacks: :async, suggest: [:image_title,:description, :category_name] #attributes for suggestions for typos up to 1 or 2 characters

  after_commit :reindex_user_category_status

  def search_data
    attributes.merge(category_name: category.name)
  end

  def reindex_user_category_status
    user.reindex
    category.reindex
    status.reindex
  end

  #process image sizes for database Andre Leslie 7/10/18
  def thumbnail select
    return self.uploads[select].variant(resize: "300x300!").processed
  end

  def full_size select
    return self.uploads[select].variant(resize: "700x700").processed
  end


  private

  #Paul Ancajima 7/17/18
  def correct_uploads_type
    if uploads.attached? == false #if uploads are not attached
      errors.add(:uploads, 'Must have image files') #error thrown
    end
    uploads.each do |u| #each upload do
      if !u.content_type.in?(%('image/jpeg image/png image/gif')) #if content type does not match (NOTE: image/jpeg etc is the type of content)
        errors.add(:uploads, 'Must be jpeg or png file') #throw error
      end
    end
  end

end