class Picture < ApplicationRecord
    mount_uploader :image, ImageUploader
    belongs_to :user
    #belongs_to :category
    has_many :favorites, dependent: :destroy
    has_many :favorite_users, through: :favorites, source: :user
    validates :content,
      length: { in: 0..140 }
    validates_presence_of   :image
    validates_integrity_of  :image
    validates_processing_of :image    
end
