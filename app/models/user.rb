class User < ApplicationRecord
  has_secure_password

  validates :name, {presence: true}
  validates :email, {presence: true, uniqueness: true}

  def reviews
    return Review.where(user_id: self.id)
  end
end
