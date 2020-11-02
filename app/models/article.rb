class Article < ApplicationRecord
  has_many :comments, dependent: :destroy
  
  validates :title, presence: true, uniqueness: true
  validates :content, length: { minimum: 50 }

  scope :are_published, -> { where(published:true).order(updated_at: :desc) }
  scope :all_by_updated_time, -> {order(updated_at: :desc)}

end
