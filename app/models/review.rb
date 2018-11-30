class Review < ApplicationRecord

  validates :rating, presence: true
  validates :rating, length: { maximum: 5 }
  validates :comment, presence: true
  validates :comment, length: { maximum: 150 }
  validates :reviewer, presence: true

end
