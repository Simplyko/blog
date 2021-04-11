class Article < ApplicationRecord
    validates :title, presence: true
    validates :text, presence: true, length: { minimum: 20 }
    
    belongs_to :user
    has_many :comments, dependent: :destroy 
end
