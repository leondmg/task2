class Comment < ApplicationRecord
  belongs_to :article

  validates :name, presence: true
  validates :content, length: { minimum: 5 }
end
