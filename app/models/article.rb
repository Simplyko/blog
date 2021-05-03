class Article < ApplicationRecord
    validates :title, presence: true
    validates :text, presence: true, length: { minimum: 20 }
		validates :writer, presence: true
    
    has_many :comments, dependent: :destroy 
end
