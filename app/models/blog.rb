class Blog < ApplicationRecord
    mount_uploader :image, ImageUploader
    belongs_to :user
    has_many :favorites, dependent: :destroy
    has_many :favorite_users, through: :favorites, source: :user
    validates :title, presence: true
    validates :content,
      presence: true,
      length: { in: 1..140 }
    validates_presence_of   :image
    validates_integrity_of  :image
    validates_processing_of :image
end
