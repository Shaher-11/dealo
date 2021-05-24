class User < ApplicationRecord
  has_many :deals
  has_many :groups
  
end
