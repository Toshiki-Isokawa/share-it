class Question < ApplicationRecord
  belongs_to :user
  
  has_many :answers, dependent: :destroy
  
  validates :title, presence: true, length: { maximum: 20 }
  validates :content, presence: true, length: { maximum: 255 }
end
