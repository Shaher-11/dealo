class Deal < ApplicationRecord
  belongs_to :author, class_name: 'User', foreign_key: 'user_id'
  has_and_belongs_to_many :groups, optional: true

  validates :amount, presence: true, numericality: { only_float: true }
  validates :title, presence: true, length: { minimum: 5, maximum: 30 }
end
