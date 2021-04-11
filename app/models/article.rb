class Article < ApplicationRecord
    validates :title, presence: true
    validates :text, presence: true, length: { minimum: 20 }
    
    has_many :comments, dependent: :destroy 
end
