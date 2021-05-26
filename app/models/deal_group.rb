class DealGroup < ApplicationRecord
  belongs_to :deal, class_name: 'Deal'
  belongs_to :group
end
