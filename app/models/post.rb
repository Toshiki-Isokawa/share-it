class Post < ApplicationRecord
    mount_uploader :image, ImageUploader
    
    belongs_to :user
    
    validates :caption, presence: true, length: { maximum: 255 }
end
