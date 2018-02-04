class User < ApplicationRecord
  mount_uploader :image, ImageUploader
  
  has_many :blogs, dependent: :destroy
  has_many :favorites, dependent: :destroy
  validates :name,  presence: true, length: { maximum: 30 }
  validates :email, presence: true, length: { maximum: 255 },
                    format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i }
  validates :password, presence: true, length: { minimum: 6 }
  validates_presence_of   :image
  validates_integrity_of  :image
  validates_processing_of :image
  
  before_save { email.downcase! }
  has_secure_password
end
