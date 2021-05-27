class Deal < ApplicationRecord
  belongs_to :author, class_name: 'User'
  has_many :deal_groups
  has_many :groups, through: :deal_groups

  validates :amount, presence: true, numericality: { only_float: true }
  validates :title, presence: true, length: { minimum: 2, maximum: 30 }
end
