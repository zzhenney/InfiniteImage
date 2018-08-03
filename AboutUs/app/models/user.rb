class User < ApplicationRecord
  include Clearance::User

  has_many :images                                       #association

  accepts_nested_attributes_for :images       #Needs to be reworked.
  validates_associated :images                #validates images

  validates_length_of :email, minimum: 5
  validates :email, presence: {message: 'Must enter an email'}, uniqueness: { message: 'already exist' }
  validates :encrypted_password, presence: { message: 'Must enter a password' }, confirmation: true
end
