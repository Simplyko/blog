class Comment < ApplicationRecord
	validate presence: true

  belongs_to :article
end
