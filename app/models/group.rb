class Group < ApplicationRecord
  belongs_to :user
  has_and_belongs_to_many :deals
  validates :name, presence: true, uniqueness: true, length: { minimum: 2, maximum: 30 }
end
