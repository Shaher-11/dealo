class User < ApplicationRecord
  has_many :deals, foreign_key: :user_id, dependent: :destroy
  has_many :groups, foreign_key: :user_id
  validates :name, presence: true, uniqueness: true, length: { minimum: 2, maximum: 30 }
end
