class Group < ApplicationRecord
  belongs_to :author, class_name: 'User'

  has_many :deal_groups

  has_many :deals, through: :deal_groups

  validates :name, presence: true, uniqueness: true, length: { minimum: 2, maximum: 30 }
end
