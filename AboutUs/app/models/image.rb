
class Image < ApplicationRecord
  belongs_to :user , optional: true      #optional needs rework. Maybe option for admin?. Paul Ancajima

  has_many_attached :uploads       #sets up images for active storage.     Paul ANcajima
  #var ":uploads" can be called anything must be accepted in params of controller IE. images_controller "
  #foreign key set up
  belongs_to :category #inherits category @image.category.<etc>


  def thumbnail select
    return self.uploads[select].variant(resize: "300x300!").processed
  end

  def full_size select
    return self.uploads[select].variant(resize: "700x700").processed
  end
end