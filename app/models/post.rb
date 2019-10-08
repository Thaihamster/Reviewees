class Post < ApplicationRecord
  validates :product_name, {presence: true, length: {maximum: 50}}
  validates :content, {presence:true, length: {maximum: 1500}}
  validates :user_id, {presence: true}
end
