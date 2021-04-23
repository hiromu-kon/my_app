class User < ApplicationRecord
  has_many :reservations, dependent: :destroy
  has_many :rooms
  before_save { self.email = email.downcase }
  validates :name,  presence: true, length: { maximum: 50 }
  validates :email, presence: true, length: { maximum: 255 },
                    uniqueness: { case_sensitive: false }
  has_secure_password
  validates :password, presence: true, length: { minimum: 6 },allow_blank: true
  validates :image, presence: true,on: :update
  validates :content, presence: true,on: :update

  mount_uploader :image, ImageUploader

  def set_image(file)
    if !file.nil?
      file_name = file.original_filename
      File.open("public/user_images/#{file_name}", 'wb') { |f|
        f.write(file.read)
      }
      self.image = file_name
    end
  end

  def User.digest(string)
    cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST :
                                                  BCrypt::Engine.cost
    BCrypt::Password.create(string, cost: cost)
  end
end
