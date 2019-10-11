class Review < ApplicationRecord
  validates :user_id, {presence: true}
  validates :post_id, {presence: true}
  validates :content, {presence:true, length: {maximum: 140}}
  validates :rating, {presence:true}
end
