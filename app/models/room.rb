class Room < ApplicationRecord
  has_many :reservations
  belongs_to :user
  validates :name,  presence: true
  validates :content,  presence: true
  validates :cost,  presence: true
  validates :address,  presence: true
  validates :image,  presence: true

  mount_uploader :image, ImageUploader

  scope :get_by_address, ->(address) {
  where("address like ?", "%#{address}%")
  }
end
