class User < ApplicationRecord
  validates :name, {presence: true}
  validates :email, {presence: true, uniqueness: true}
  validates :password, {presence: true}

  has_secure_password
  has_one_attached :image
  has_many :tasks
end
