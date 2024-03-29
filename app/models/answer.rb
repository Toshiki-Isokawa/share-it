class Answer < ApplicationRecord
  belongs_to :user
  belongs_to :question
  
  validates :content, presence: true, length: { maximum: 100 }
end
