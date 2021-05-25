class User < ApplicationRecord
  has_many :deals
  has_many :groups

  validates :name, presence: true, uniqueness: true, length: { minimum: 2, maximum: 30 }
end
