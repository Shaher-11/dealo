class User < ApplicationRecord
  has_many :deals
  has_many :groups

  validates :name, presence: true, uniqueness: true, length: { minimum: 4, maximum: 30 }
end
